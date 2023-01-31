Return-Path: <SRS0=wYM+=54=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96309C38142
	for <soc@archiver.kernel.org>; Tue, 31 Jan 2023 11:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 75216C433EF; Tue, 31 Jan 2023 11:13:29 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 40A29C433D2
	for <soc@kernel.org>; Tue, 31 Jan 2023 11:13:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 40A29C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-ej1-f47.google.com with SMTP id k4so35052692eje.1
        for <soc@kernel.org>; Tue, 31 Jan 2023 03:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmhqSKwbLMTnadViEemiKzjunZ3k+gXB/MWPzgSgSAg=;
        b=cBUXf5r+KkCjEMDpkwfqlzGWSXrJfQDN5bAslMejEOao7Liwomd/1KPrET6LnLww24
         hAJTb1QOf/4XyLbcMSqmyZv0GTnqKAxKPLB9xR1sIbkJfcAPQ8sc7x+BOTDZUpZIRoxA
         KF8GIwsqLoYOi8XVcukmqA5QP0yoziqR0E26ojWeVv9m1WXi2tgx6K6pQQEidbMirOTh
         FoHeH9UxWPR9UPYEEwovRt+ctAZWs/ZawJQeV1xPM735/x/cUj29RfValSrbvMllMg3J
         7KzQV8Lojlyfmd6VUjDRagzfq5hIqqhfix+zFjI/xK3zOBJzrI6hF54BMHyUPZuJVfjp
         IlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MmhqSKwbLMTnadViEemiKzjunZ3k+gXB/MWPzgSgSAg=;
        b=S9ehDTgzP4u2dll2tLHMavR/fTpfRPUn9Q5hxDcOPBx6JIrpKXoJkO73DKvs3QfjYG
         8tsDfiMWu7yxiPq+76n6sMm4+BWnnWsnv+9P8CZSZ0aPaAv0u5XaJTUPziVEuRjQbQ+w
         36m7M7bERfH12cLUeG3I1+rutvipIDOCpsuP0GdtXX7vR/kQP8FFJ1r7O2zlk+pjq7Is
         3FZG73VyuZ+0iPtkak86I46BHohiJBIJ+/h/XgefaGtG6/lyqdZNWSaUbdvZeZh9kWxZ
         KlUQFicJBww7fKvBfsvNLiXDieLhQfPLqSg0kiIhFmYrcpLzMArqdhh5BLg4Y3tVv/Wv
         IF5g==
X-Gm-Message-State: AO0yUKWQ/jvo7YjtTYJtmURq9V8mNr7wRXPGDw4eUck3IeIYBmyhJbeb
	0Dqbca2lNfLFqg++m/nzPgjHv9cSCgbrg5/a
X-Google-Smtp-Source: AK7set+8hrPGAYxZIavsqaPrJ/quJsGGtvWPnrOeU1zuZT5gXFDcv/+P2w+cY9GuulZppPPJfaGHMA==
X-Received: by 2002:a17:906:4912:b0:878:4e83:b058 with SMTP id b18-20020a170906491200b008784e83b058mr21238748ejq.1.1675163606199;
        Tue, 31 Jan 2023 03:13:26 -0800 (PST)
Received: from [192.168.0.105] (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id rh16-20020a17090720f000b0087329ff593fsm8275236ejb.144.2023.01.31.03.13.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 03:13:25 -0800 (PST)
Message-ID: <5d7785ca-7fe0-1597-c56a-7a0f4d230db8@monstr.eu>
Date: Tue, 31 Jan 2023 12:13:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: "git (AMD-Xilinx)" <git@amd.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] ARM: soc: zynq: Xilinx SoC changes for v6.3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

please pull this one small patch to your tree.

Thanks,
Michal

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

   https://github.com/Xilinx/linux-xlnx.git tags/zynq-soc-for-v6.3

for you to fetch changes up to 9eedb910a3be0005b88c696a8552c0d4c9937cd4:

   ARM: zynq: Fix refcount leak in zynq_early_slcr_init (2023-01-05 10:07:43 +0100)

----------------------------------------------------------------
ARM: Zynq SoC changes for v6.3

- Fix refcount leak in zynq_early_slcr_init

----------------------------------------------------------------
Qiheng Lin (1):
       ARM: zynq: Fix refcount leak in zynq_early_slcr_init

  arch/arm/mach-zynq/slcr.c | 1 +
  1 file changed, 1 insertion(+)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs

