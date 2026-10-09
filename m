Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AFA49B1FB
	for <soc@lists.linux.dev>; Fri,  9 Oct 2026 09:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791537851; cv=pass; b=NtMgka1snPice0lyorGUg2s7UvSdGYVu/xXTFouwcOaAU3XI80qdnUCe/2qs9b9OpHya/GRE6JLaW3FDQBu0dSaHnm6P+03visxzobUM5lY/LAV8LXNIWuGw+Wb+JK/OhpFLoydHH8kPKOHLdffbjb7/qymQNYn/KFG7IB1SQ8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791537851; c=relaxed/simple;
	bh=XgNkPeYW7ROgFKS71jetaL6YjpKcSR2rKTGynR4c8UY=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=l6zIqKsp2IIxbb2RG2nHwUBkLktijUrtNlU3D+hX6l77vFy+5C6QGYmh4/I1wIzLn7bJtwENf87SHnH+dSYZ7+bjtOLvmJvL2345smGINrA0eeNSkQ0tTKQ97a/xI9dRuRA8uu5JEVV1Mp4GpcXw+40UEEqJ3YsItJuU3CAnwYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tdM94Avr; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tdM94Avr"
Received: by smtp.kernel.org (Postfix)
	id F34B01F00898; Fri,  9 Oct 2026 09:24:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=95.215.58.127
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791537848;
	b=ViPHSwZr+hqt+i5ugRz8buwsvg6agdvRRQvgsGhXTZge96TrVGEunKtG2E+lSY7QJx2f
	 2eUJMyVZhpawtZbSskPVoqskxE5IaxvAWyOcBMSasWqOfHQb6zNZGHCzic9ou/qfLF6DA
	 obZUqQy5HeFFxQD9C2+Xa4U9uV8/0cryx/hLKF933WI8otXO1VDCVi3Fye4Uz0Y5l5smZ
	 lbdsQH/FOlP39Lsi6FFFcXYQLEFdQ9i2jqMgOJi4qUSneuaBtildLEXMCjS0+y0n/XBMD
	 j/Q5ykubGbnrdc93RI4dd0ADing92u8pPA+iQ+K9j/ZbjJdU4FCsen0W4Xj9JjQg4Hw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791537848;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 To:Cc:From:Subject:Content-Type:Content-Transfer-Encoding;
	bh=b8CG302VixB0WKvkywXPuuW7AQv6hdXONDKAD/cyYvs=;
	b=pyKf/IJvS21miPouzlVGY4LhPe6RkSlzAUHKPvjrd1Pd7zbNGyt5RImyy9ADmzLDey4o
	 9Z/i9hGpkH5hAh4beecNq/yPTkFaLAtxc2BODLjflT6gsSpUfmEAkbqJ6T3aQ5haHi+09
	 j40eyaWfPIq1rLlc5NCE8REKqzoXcB5wdpvEQsWJVKa46v4R3dQDDCtUxkoGeZIGrjqBV
	 L27+cOWaMa+m38KjdbbFsEpFHfdbnRcO7sPaNjRsp/izlptNmqcKOTtUsPaN0JHrorIL8
	 kNDomVIIoCEz7ScHchq7J9hCRGzaLOIVbTmY79+DJMhlP3ID2QXiS5FU3ds9FP71XJA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tdM94Avr;
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=95.215.58.127
Received: from mta1.migadu.com (out-127.mta1.migadu.com [95.215.58.127])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1BA4D1F000FF
	for <soc@kernel.org>; Fri,  9 Oct 2026 09:24:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tdM94Avr
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 1BA4D1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: soc@kernel.org
DKIM-Signature: a=rsa-sha256; bh=XgNkPeYW7ROgFKS71jetaL6YjpKcSR2rKTGynR4c8UY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791537846; v=1; x=1792142646;
 b=tdM94AvrRqD838H30yqCwyom9HqrVohl4apyzYL5Uhy5WwDZsg53sasx5YA0yfWs9evq2jfo
 r1bhq8H0MdYAJd06taPHBi8fP+9Gn9rqxStEPEcxlFUgr4wvrp0tI/HdiziAcsh9Ou2pvWNHIE2
 1+LnWHLm5y2n8o9ouygytbek=
X-Envelope-To: soc@kernel.org
Received: by smtp.migadu.com with ESMTPS id bd9b3ea451def7a3;
	Fri, 09 Oct 2026 09:24:06 +0000
X-Mizu-Trace-ID: bd9b3ea451def7a3
X-Migadu-Flow: FLOW_OUT
Message-ID: <aff6ff25-8969-4a35-9543-9113afb2e003@linux.dev>
Date: Fri, 9 Oct 2026 17:23:58 +0800
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Chen Wang <chen.wang@linux.dev>, Han Gao <gaohan@iscas.ac.cn>,
 Hangfan Li <lihangfan@iscas.ac.cn>, Chen-Yu Yeh <chenyou910331@gmail.com>,
 Andrei Lalaev <andrey.lalaev@gmail.com>
From: Chen Wang <chen.wang@linux.dev>
Subject: [GIT PULL] RISC-V Sophgo Devicetrees for v7.4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hey Arnd,

Please pull this dt changes for RISC-V/Sophgo.

Thanks,

Chen

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

   https://github.com/sophgo/linux.git tags/riscv-sophgo-dt-for-v7.4

for you to fetch changes up to 60e4cafd30908e7d8cdfdb4fa1a74dabed9f47b5:

   riscv: dts: sophgo: sg2002-milkv-duo256m: drop reserved memory node 
(2026-10-08 09:13:17 +0800)

----------------------------------------------------------------
RISC-V Devicetrees for v7.4

Sophgo:

For CV18xx serials:
- Add an overlay to enable MAC and MDIO multiplexer to
   reach the internal PHY so we can use Milk-V Duo 256M
   board with optional ethernet interface.
- Fix the name of the internal PHY node.
- Drop reserved memory node, and leave FSBL to decide
   this at runtime.

For SG2042:
- Limit SPI NOR to 12.5 MHz.

For SG2044:
- Enable both SPI NOR controllers.

Signed-off-by: Chen Wang <chen.wang@linux.dev>

----------------------------------------------------------------
Andrei Lalaev (2):
       riscv: dts: sophgo: cv1800b-milkv-duo: drop reserved memory node
       riscv: dts: sophgo: sg2002-milkv-duo256m: drop reserved memory node

Chen-Yu Yeh (2):
       riscv: dts: sophgo: add Milk-V Duo 256M ethernet support overlay
       riscv: dts: sophgo: cv180x: Fix internal ephy node name

Han Gao (1):
       riscv: dts: sophgo: Limit SG2042 SPI NOR to 12.5 MHz

Hangfan Li (1):
       riscv: dts: sophgo: Enable SPI NOR on SRD3-10

  arch/riscv/boot/dts/sophgo/Makefile                |  3 +++
  arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts   | 11 ----------
  arch/riscv/boot/dts/sophgo/cv180x.dtsi             |  2 +-
  .../boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso  | 17 +++++++++++++++
  .../riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts | 11 ----------
  arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts       |  4 ++--
  arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts       |  2 +-
  .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts |  4 ++--
  .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts      | 24 
++++++++++++++++++++++
  9 files changed, 50 insertions(+), 28 deletions(-)
  create mode 100644 
arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso

