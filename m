Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2DC13B592
	for <soc@lists.linux.dev>; Fri,  1 Nov 2024 12:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730464969; cv=none; b=LRW1C7rCKYVYheLLlsf+emOr8ECXNT4+uuY4z0kjwb7j/R2LVipsYqiKntj5kDcP7GzZC9pBlqOoviEWqlJy7hbt8YlwNLokRhQ5kAOASl7buRTXVu/SKt75SHa3R8BsVBdI9iQB0j0ODM6WdcZQ65etHVmh8sPyN1eMRbNOpO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730464969; c=relaxed/simple;
	bh=QMlwUcYLIejqk6vPsStr+Mx95JU8QPYpcbLaZPv7yNo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=jQnfYOOQBjhnknYo+07f97JRzmv2j0rHGo1sTt6g3wO5AxhUPpJr3ZzovJqy22j5xXm6wi/0WV1Ya0UWCsm+74Ez9Y4TmOLJs6EdCvt8SUHLU5FoB4zUPJoGbCkl6Q5SOo6Qs6Ry1MmotB2TwIHfgrQ4i2cm0s8NolMmcDvvK04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b=KMgtSwMY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b="KMgtSwMY"
Received: by smtp.kernel.org (Postfix)
	id 8FA9EC4CECE; Fri,  1 Nov 2024 12:42:48 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D0B87C4CECD
	for <soc@kernel.org>; Fri,  1 Nov 2024 12:42:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D0B87C4CECD
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e30eca40dedso1433788276.3
        for <soc@kernel.org>; Fri, 01 Nov 2024 05:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1730464964; x=1731069764; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nDPdY+/4invWPUONVGXUjS95GHw2AfhJ6NmBgm0MP/c=;
        b=KMgtSwMYRaqxF+aj21GCbrTU8jhvfcn8Zw0r/Wn+MU/A8nu7unDCKQbBUxzyZKP3nj
         fv4UREMpQeHhp5EKJgVxkfsVYn8GBduUS2lcnApfOZhp8xIOEZDFRJbLsB/dgyGVyOcS
         yCxZ8InEj2TJQd6fHVGOp5ZPURYJs0Le40oOz3/gX4evzejMlZ4jBrNOTsjEHUI9hZNU
         fz/kqMcdjy+KycwANEFhwfyZn1SCJ8iQ8CbVnXX8eL8oNr4qjXS1eneWkuP/v/zoCBfW
         4C1ULkRFfi3Y8zv5vEI2/LmqNHDQk7BnSU0pXigJogAgRu1zc4wvRc+T34UUEpdeBGNv
         Ux6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730464964; x=1731069764;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nDPdY+/4invWPUONVGXUjS95GHw2AfhJ6NmBgm0MP/c=;
        b=Tp0Kf7Svq78wF3O0n4ZhELzsOgESjwDiqJGI+1QEjDq7JjLj+8/nVhtcZRX8l8T45b
         7OuYNgCeREEKL2kO8oQoycIVHiM+iGn/FdMI+8y02fUYVrcUHctV9gfonTDZguzj97mi
         XUIZh/wjt1q2ii89F3T9gOUorZ4rNmmqMrrSLGbaozfOh2T+kwWfFD9BnxA+S/Zd7DRS
         Bff8Yow2IbcTj7RdCcJkfs2+55IzR8EkCxAkfJtGS33Bm5I47YtkRVxI+M5cLbvvWmBH
         qs9NG0mWVHNyxBfk+nHICUme/HtLN6ELjIzoZsrWV3OdlXNVZkLHNi7hpi3/5WeBuQbE
         ZrZQ==
X-Gm-Message-State: AOJu0YxaiOIQKs8+aVIzk023VQXr2a9m0hBTrM8whEUa8Z+rpfiHpeY1
	g2vkx9eP+bbNHROYcXv7244GV4kKcgIl4l4jjFSwGNQgIn6GxsYxf5ntH3sN+KWRRnQKqsuXISq
	O3ZmEQOmhGOqJ5h9N8g75U+wPWZdQbseNuZsQBdv5DFFEq/H/vaso
X-Google-Smtp-Source: AGHT+IGmpmK40uDFDGtbHZhk+AvfupqtNOoAgSUIlP0YIN83OzjCHSLPIM772jSFQMYyHAoAA3dt882tFrIsPSQsGrQ=
X-Received: by 2002:a05:6902:4ac:b0:e2b:dbf6:34ca with SMTP id
 3f1490d57ef6-e3302660c43mr2471614276.36.1730464964320; Fri, 01 Nov 2024
 05:42:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Fri, 1 Nov 2024 13:42:32 +0100
Message-ID: <CAHTX3d+x1WrXhsp6+PQbo-B3T9q21tqE1RkhVsh0r7my3vH37g@mail.gmail.com>
Subject: [GIT PULL] arm64: dts: ZynqMP DT changes for 6.13
To: SoC Team <soc@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

please pull these 3 patches to your tree.

Thanks,
Michal

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-dt-for-6.13

for you to fetch changes up to d57df7a7b78eecfe65cb358faf27ad5872bd297f:

  arm64: zynqmp: Add thermal zones (2024-10-02 09:21:26 +0200)

----------------------------------------------------------------
arm64: ZynqMP DT changes for 6.13

- Enable AMS for all boards including HWMON
- Add thermal zones

----------------------------------------------------------------
Sean Anderson (3):
      arm64: zynqmp: Enable AMS for all boards
      arm64: zynqmp: Expose AMS to userspace as HWMON
      arm64: zynqmp: Add thermal zones

 arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts |  18 ----
 arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts |   4 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts |   4 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts |   4 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts |   4 -
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi            | 101 +++++++++++++++++++-
 6 files changed, 100 insertions(+), 35 deletions(-)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
