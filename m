Return-Path: <SRS0=hzE+=KD=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FE9C54E49
	for <soc@archiver.kernel.org>; Mon, 26 Feb 2024 12:42:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3CE18C433C7; Mon, 26 Feb 2024 12:42:42 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 32C5CC43390
	for <soc@kernel.org>; Mon, 26 Feb 2024 12:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 32C5CC43390
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dcd7c526cc0so2737765276.1
        for <soc@kernel.org>; Mon, 26 Feb 2024 04:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1708951358; x=1709556158; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/Cv8Zhaha1bUY4OUTYviydtpeUsQpVdHMr4jsvQC0y8=;
        b=ePv5Igm+B9xKszg/wPr7L32thw9gbr7PL9Ybj1nC+YBoTMwqgoI1Fp0z1/77fu/wJS
         dXx8Uvi6fnfvpc/mmhhQ/NEo8EmgfE+mBHLPGZOpFMJNHEcLios38VjoMwbeurvLqRvw
         saNkm02FZY7hGt3m6J5J6sVoKBK4JQF+DDqzcdnJ6SnF8DsN+5PanjHSvHaPo99MZK9X
         bTO7mdtdTS7jqHG0ldgsIVGYj/kIsLmmA4NSIkIaWBv0SM9rhpCksfStEPHqaZKAcfpN
         +djJ3LSm/B96NXzgaDs5hDC+TexjoFEr+5RV53IL1sStJJi4UOCuLnXZlUuozWYLc+N9
         kO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708951358; x=1709556158;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Cv8Zhaha1bUY4OUTYviydtpeUsQpVdHMr4jsvQC0y8=;
        b=QSa4FrYAk9OROXO/ZOmTdvLzEwacqfWhzY0PwFzetoohJ71RihWsqQHD/xGRgD8KdS
         ES1CJIa1hm0VmhJqmSYSWlhslfKByg1cKqw64+nyQIRI9h/wV9SWDFbitI9H92wGE1Rp
         RZMU2Rxd05gSS6Bsq/Tgmmq4+La/Gpl7oFtYlyK9To1GbmjXdl6I5lrvWdXg4Vz7wPb/
         29i1BUoS0RO7Sz0oyPAKYd561coxlUdT3agS1/gPZBia8dxsV3yMFdKngW11yJ63r9oJ
         SynHaoBkUdBwcLxAqIOGaThxTF/oRafX1l/nse+dIpTvAq5mOpYijvwFg66sI2cLy+wG
         ww5w==
X-Gm-Message-State: AOJu0YyYzXIuWYWJRoobfTmz+d1UeVMVVUZpJoMdWXBPhYz9lQaOAJ1o
	QWj+xzTEPJOtVAqwbxK18phC13k6HFgnwaf2idQ1Y5AU1rbIteq5va4LNiAFeXvF71RXuE2nQtO
	/9D6Y/NCx1aOV4PPHbxGFcUQp2ROX3uRqOYgDH/DGWQ9l5t55U4qK
X-Google-Smtp-Source: AGHT+IFk3Von2kjxRN6PCCDhbD85LmoKh1M4fAND7VtJ8AunNLUG7mAq+n5pnQPoIxXmR4rhVYyoPh7fD7TcquGKTPU=
X-Received: by 2002:a25:af4a:0:b0:dcc:d5aa:af36 with SMTP id
 c10-20020a25af4a000000b00dccd5aaaf36mr4477477ybj.44.1708951358329; Mon, 26
 Feb 2024 04:42:38 -0800 (PST)
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Mon, 26 Feb 2024 13:42:27 +0100
Message-ID: <CAHTX3d+NGUJhKXxGwskSOf6U9P0Nd9rnroFczD8X2mLhFgcm0Q@mail.gmail.com>
Subject: [GIT PULL] arm64: ZynqMP SoC changes for v6.9
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

We discussed this change via the side channel with Abhyuday and he is
fine with this change but he is not willing (after discussion with his
current employer and for whatever else reason) to even ack this
change. Listed xilinx email is no longer working too. That's why based
on our talk I am sending a single patch to change the maintainer of
Xilinx event management driver to unblock this situation.

Thanks,
Michal

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-6.9

for you to fetch changes up to be53a3b3bc58bb5be6c4228523b071b345d5574b:

  soc: xilinx: update maintainer of event manager driver (2024-01-23
14:57:47 +0100)

----------------------------------------------------------------
arm64: ZynqMP SoC changes for 6.9

- Update maintainer for event manager

----------------------------------------------------------------
Jay Buddhabhatti (1):
      soc: xilinx: update maintainer of event manager driver

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
