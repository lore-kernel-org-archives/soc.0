Return-Path: <SRS0=VUrm=H2=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D76C35274
	for <soc@archiver.kernel.org>; Fri, 15 Dec 2023 14:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 72192C433C7; Fri, 15 Dec 2023 14:10:38 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5FD29C433C8
	for <soc@kernel.org>; Fri, 15 Dec 2023 14:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5FD29C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a1da1017a09so83877566b.3
        for <soc@kernel.org>; Fri, 15 Dec 2023 06:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1702649434; x=1703254234; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RCH2EiZ+ek1Ij7qN6TfXyldN7z8TnH1JVRCS0AsCfe0=;
        b=cHQKJUDZzc8sH/rXnlss5//VBbo6o2H+OKzJpJdH36gzu4PNbaClfX4WRNwbGof8Kx
         bMoztMQhMjoqKXF0arkg9cgjmL5wflj1k0+NFd/UR1xsoQgumjK7UhGgAHpgq7HGu1UH
         CXHKNhktxB2bPD3dG5QgCS/th4QeiEoSiEm1uD/3IMwStqO+yZyiUW7O1TMhAkFBh+GE
         ksyxSMVk6Tcke739RTRny5ovxC5YZ/eigzce5PrM14RxCgTv7+3uQ95YYVzQFgSynoxd
         2tkO2OvFuEdpj2DyvkyxyUQn/jE1ppiRttL8JkeKuaiWll7baNThLdZa/G0GKoQ7hChU
         N+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702649434; x=1703254234;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RCH2EiZ+ek1Ij7qN6TfXyldN7z8TnH1JVRCS0AsCfe0=;
        b=VamF7lkn+Sa8uY0dsGaP+BGgHnpcDADlfrVgB+35YB8UjTmvfQa7p43sjT7NQnBtJB
         EEdCc5iaSzH16ZFnk4oO8uzbFnbicEE2zmpCTtl56nUyf3IOn9KVf5DExZ07nzToX3dW
         aoxCZLqwlnvBLN0fyqCONE3+edC+iPzvn1ZG3vE6tiSnPv+RFkxhs1cUx/7D24pmYXwj
         YkdD+d7py+glr2PmgK0GD9jqpefXGs14RbMoLP+bkM2RVE5TtKulcXuC/vuVqUPqgggb
         hOcGi+UX1Lo7QEFsDnlvRWIMBlALblRYY7PYFZNyv5fdA9TFEJ7huzN2cVO948ibxh3f
         XPmw==
X-Gm-Message-State: AOJu0YyrGbuc0S0NBL5YuxAQwYHJ9iqZEYGlGxO7Qy05w+iNIglYMyLg
	8rwQ5fPHhlm/upfdBAz+l1BF96Dr9aUb1SiOGFl8hQ==
X-Google-Smtp-Source: AGHT+IGfcJbg3kEpVAprqdoI/0V11qtjMVWPibds8tto2IasJMgSf0/wBopO41E0Q6XlXMJWqJddEg==
X-Received: by 2002:a17:906:3288:b0:a19:a19b:78af with SMTP id 8-20020a170906328800b00a19a19b78afmr5341456ejw.114.1702649433741;
        Fri, 15 Dec 2023 06:10:33 -0800 (PST)
Received: from [10.254.183.223] ([149.199.62.131])
        by smtp.gmail.com with ESMTPSA id ry9-20020a1709068d8900b00a1f7470ba93sm10011445ejc.200.2023.12.15.06.10.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Dec 2023 06:10:32 -0800 (PST)
Message-ID: <a41bcab2-1d28-42fd-b5ff-1d6fb5226cf1@monstr.eu>
Date: Fri, 15 Dec 2023 15:10:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] arm64: soc: ZynqMP SoC changes for v6.8
Autocrypt: addr=monstr@monstr.eu; keydata=
 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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

please pull these patches to your tree.

Thanks,
Michal


  The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

    Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

  are available in the Git repository at:

    https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-6.8

  for you to fetch changes up to 87fda1acfc3b9048261799817ef749e6deb95724:

    soc: xilinx: Add error message for invalid payload received from IPI 
callback. (2023-12-13 16:55:15 +0100)

  ----------------------------------------------------------------
  arm64: ZynqMP SoC changes for 6.8

  power driver:
  - Move to remove_new hook
  - Report error around unsupported callback
  - Fix long messages

  event driver:
  - Fix cpu_id handling
  - Fix warning message

  ----------------------------------------------------------------
  HariBabu Gattem (1):
        soc: xilinx: Fix for call trace due to the usage of smp_processor_id()

  Michal Simek (1):
        soc: xilinx: fix quoted string split across lines

  Naman Trivedi Manojbhai (1):
        soc: xilinx: Add error message for invalid payload received from IPI 
callback.

  Tanmay Shah (1):
        soc: xilinx: fix unhandled SGI warning message

  Uwe Kleine-König (1):
        soc/xilinx: zynqmp_power: Convert to platform remove callback returning void

   drivers/soc/xilinx/xlnx_event_manager.c |  7 +++++--
   drivers/soc/xilinx/zynqmp_power.c       | 16 ++++++++--------
   2 files changed, 13 insertions(+), 10 deletions(-)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs

