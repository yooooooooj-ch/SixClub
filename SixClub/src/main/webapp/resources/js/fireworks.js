document.addEventListener('DOMContentLoaded', () => {
  const canvas = document.getElementById('fireworks-canvas');
  if (!canvas) return;

  const ctx = canvas.getContext('2d');
  let cw = window.innerWidth;
  let ch = window.innerHeight;
  canvas.width = cw;
  canvas.height = ch;

  // 🔷 프로젝트 메인 컬러들 (고정된 폭죽 색상)
  const mainColors = ['#f0f8ff', '#f0f8ff', '#003366', '#00aaff'];

  // HEX → RGB 변환 함수
  function hexToRgb(hex, factor = 0.6) {
  hex = hex.replace('#', '');
  const bigint = parseInt(hex, 16);
  let r = ((bigint >> 16) & 255);
  let g = ((bigint >> 8) & 255);
  let b = (bigint & 255);

  // 🔽 밝기 톤다운 (예: 85%)
  r = Math.floor(r * factor);
  g = Math.floor(g * factor);
  b = Math.floor(b * factor);

  return [r, g, b];
}

  let fireworks = [];
  let particles = [];
  let animationFrameId = null;
  let fireworkInterval = null;

  // 랜덤 숫자 생성
  function random(min, max) {
    return Math.random() * (max - min) + min;
  }

  // 두 점 사이 거리 계산
  function distance(x1, y1, x2, y2) {
    return Math.sqrt((x2 - x1) ** 2 + (y2 - y1) ** 2);
  }

  // 🎇 폭죽 본체 클래스 (위로 날아가다가 파편 생성)
  class Firework {
    constructor(sx, sy, tx, ty) {
      this.x = sx;
      this.y = sy;
      this.sx = sx;
      this.sy = sy;
      this.tx = tx;
      this.ty = ty;
      this.distanceToTarget = distance(sx, sy, tx, ty);
      this.distanceTraveled = 0;
      this.coordinates = [];
      this.coordinateCount = 3;
      while (this.coordinateCount--) {
        this.coordinates.push([this.x, this.y]);
      }
      this.angle = Math.atan2(ty - sy, tx - sx);
      this.speed = 4;
      this.acceleration = 1.05;
      this.brightness = random(70, 100);
      this.targetRadius = 1;

      // 메인 컬러 중 랜덤 선택
      this.color = mainColors[Math.floor(Math.random() * mainColors.length)];
    }

    // 위치 업데이트 및 파편 생성
    update(index) {
      this.coordinates.pop();
      this.coordinates.unshift([this.x, this.y]);

      if (this.targetRadius < 8) {
        this.targetRadius += 0.3;
      } else {
        this.targetRadius = 1;
      }

      this.speed *= this.acceleration;

      let vx = Math.cos(this.angle) * this.speed;
      let vy = Math.sin(this.angle) * this.speed;
      this.distanceTraveled = distance(this.sx, this.sy, this.x + vx, this.y + vy);

      if (this.distanceTraveled >= this.distanceToTarget) {
        // 도착 시 파편 생성 후 제거
        createParticles(this.tx, this.ty, this.color);
        fireworks.splice(index, 1);
      } else {
        this.x += vx;
        this.y += vy;
      }
    }

    // 폭죽 그리기
    draw() {
      ctx.beginPath();
      ctx.moveTo(this.coordinates[this.coordinates.length - 1][0], this.coordinates[this.coordinates.length - 1][1]);
      ctx.lineTo(this.x, this.y);
      ctx.strokeStyle = this.color;
      ctx.lineWidth = 3; // 더 굵게
      ctx.strokeStyle = this.color;
      ctx.stroke();

      // 도착 지점 원
      ctx.beginPath();
      ctx.arc(this.tx, this.ty, this.targetRadius, 0, Math.PI * 2);
      ctx.lineWidth = 2;
      ctx.strokeStyle = this.color;
      ctx.stroke();
    }
  }

  // 💥 폭죽 파편 클래스
  class Particle {
    constructor(x, y, hexColor) {
      this.x = x;
      this.y = y;
      this.coordinates = [];
      this.coordinateCount = 5;
      while (this.coordinateCount--) {
        this.coordinates.push([this.x, this.y]);
      }
      this.angle = random(0, Math.PI * 2);
      this.speed = random(2, 12); // 빠르게 퍼지도록
      this.friction = 0.95;
      this.gravity = 0.7;
      this.brightness = random(70, 100);
      this.alpha = 1;
      this.decay = random(0.01, 0.02); // 천천히 사라지도록
      this.rgb = hexToRgb(hexColor); // 고정된 RGB 컬러 사용
    }

    // 위치 및 투명도 업데이트
    update(index) {
      this.coordinates.pop();
      this.coordinates.unshift([this.x, this.y]);

      this.speed *= this.friction;
      this.x += Math.cos(this.angle) * this.speed;
      this.y += Math.sin(this.angle) * this.speed + this.gravity;
      this.alpha -= this.decay;

      if (this.alpha <= 0) {
        particles.splice(index, 1);
      }
    }

    // 파편 그리기
    draw() {
      ctx.beginPath();
      ctx.moveTo(this.coordinates[this.coordinates.length - 1][0], this.coordinates[this.coordinates.length - 1][1]);
      ctx.lineTo(this.x, this.y);
 
      ctx.lineWidth = 2.5; // 선명하고 굵게
      ctx.strokeStyle = `rgba(${this.rgb[0]}, ${this.rgb[1]}, ${this.rgb[2]}, ${this.alpha})`;
      ctx.stroke();
    }
  }

  // 💫 파편 여러 개 생성
  function createParticles(x, y, color) {
    let particleCount = 80;
    while (particleCount--) {
      particles.push(new Particle(x, y, color));
    }
  }

  // 🚀 폭죽 발사 (여러 발)
  function launchFireworks() {
    for (let i = 0; i < 6; i++) {
      let startX = cw / 2;
      let startY = ch;
      let targetX = random(cw * 0.2, cw * 0.8);
      let targetY = random(ch * 0.1, ch * 0.5);
      fireworks.push(new Firework(startX, startY, targetX, targetY));
    }
  }

  // 🔁 애니메이션 루프
  function loop() {
    // 배경 흐릿하게 처리 (잔상 효과)
    ctx.globalCompositeOperation = 'destination-out';
    ctx.fillStyle = 'rgba(240, 248, 255, 0.03)';
    ctx.fillRect(0, 0, cw, ch);
    ctx.globalCompositeOperation = 'lighter';

    let i = fireworks.length;
    while (i--) {
      fireworks[i].draw();
      fireworks[i].update(i);
    }

    i = particles.length;
    while (i--) {
      particles[i].draw();
      particles[i].update(i);
    }

    animationFrameId = requestAnimationFrame(loop);
  }

  // 🔛 폭죽 시작
  function startFireworks() {
    if (!animationFrameId) {
      launchFireworks();
      loop();
      fireworkInterval = setInterval(launchFireworks, 500);
    }
  }

  // ⏹️ 폭죽 멈추기
  function stopFireworks() {
    if (animationFrameId) {
      cancelAnimationFrame(animationFrameId);
      animationFrameId = null;
    }
    if (fireworkInterval) {
      clearInterval(fireworkInterval);
      fireworkInterval = null;
    }
    fireworks = [];
    particles = [];
    ctx.clearRect(0, 0, cw, ch);
  }

  // 외부에서 제어할 수 있도록 window에 바인딩
  window.startFireworks = startFireworks;
  window.stopFireworks = stopFireworks;

  // 창 크기 변경 시 캔버스 재설정
  window.addEventListener('resize', () => {
    cw = window.innerWidth;
    ch = window.innerHeight;
    canvas.width = cw;
    canvas.height = ch;
  });
});
