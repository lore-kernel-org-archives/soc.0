Return-Path: <SRS0=wYM+=54=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B982FC38142
	for <soc@archiver.kernel.org>; Tue, 31 Jan 2023 11:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 77200C4339B; Tue, 31 Jan 2023 11:01:19 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 65469C433D2
	for <soc@kernel.org>; Tue, 31 Jan 2023 11:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 65469C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-ed1-f42.google.com with SMTP id z11so14022702ede.1
        for <soc@kernel.org>; Tue, 31 Jan 2023 03:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qbWHAA+9U/zbIsX0zcrCLq5nIldV7GcytNqiCgm/18=;
        b=nP/YsOOak45EqOEU1amNagtfULALSH9FT641p1CWBO022Vv7b3AzmU0/V8Cw3msU2+
         /SOdMXfPYn7FKNotDfq96fn3uWqIT4fUYfwFzhET3qDG8dTRpyCUbE5Hg3lxTlKj2YdX
         xINZbw2Nki/kEg0vJ3vTgQvc8pIscdPSOlImPxwFdditwsP/kMvaUeFEm0L9HoIxqK+F
         kVrE7yH6RFsKrGlhbqEXcF6POA6lak0tS0/wSHBTPmuK3ql7D00FFkm88h5NWJh5oBV+
         CDORA5Iw6quap2am/NUOwmtb3G/nKyDeJsqout1eZIwHXA+kUSSLt/9H2QCzKmuon+qd
         s4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/qbWHAA+9U/zbIsX0zcrCLq5nIldV7GcytNqiCgm/18=;
        b=N9n3kKTdKrGYMXrNwJx5u3NP3YOTxm1+A0oDaFf1XmKlMya6hju7sH4aunsMXlYY2X
         o1kvw+n3V16Ry20IIJhSfICw7JUOnoNZLFhHXwzA800e0KaFrXsHK/BHm7or7kE+Aykz
         UUb8qffGIVT3LSO4/Ye9UcXBIL8/y96pra6DTEENFS5210ujLXFUvyyqkZVWnqOH7z/Q
         OwXVTrysjBopXU5ReasOyttzH1SOpFC715Qviv/dVoQn+JUj5URUikIaedSZxBuRZ7tU
         H+iTAvGrkC0z0EGR4IBUJC4HV+t0XuJSzNOtKN+8c7H2ap1BicQoGH6+0vNt/I4DK7HF
         Yslw==
X-Gm-Message-State: AO0yUKVT+mXX+reve2uvJN3xFXex/X7N+9LvpS6O82iMoySWqFfsu08V
	nlfrc9pMOY4egiAOuXQ+k26ugMAq3FocFcOs
X-Google-Smtp-Source: AK7set8xzsBLxTc3i3rDP/xEGBuFLMto3KGlUDqT+O7wueKlAZVU5dfZJkZxCzSjJBMd2uFQr5aCpg==
X-Received: by 2002:a05:6402:278c:b0:49e:eb5:ed05 with SMTP id b12-20020a056402278c00b0049e0eb5ed05mr4220326ede.9.1675162874387;
        Tue, 31 Jan 2023 03:01:14 -0800 (PST)
Received: from [192.168.0.105] (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id q23-20020a056402041700b0048eb0886b00sm8146172edv.42.2023.01.31.03.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 03:01:13 -0800 (PST)
Message-ID: <850bb18f-ca22-f3d7-71a7-f367bfef4ccc@monstr.eu>
Date: Tue, 31 Jan 2023 12:01:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] ARM: dts: zynq: Xilinx DT changes for v6.3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

please pull these DT changes to your tree. Especially QSPI one is in the queue 
for a while. Other 3 are created to align DT with dt schema.

Thanks,
Michal


The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

   https://github.com/Xilinx/linux-xlnx.git tags/zynq-dt-for-v6.3

for you to fetch changes up to 8932a99240f53aa5dc5f56da3345ebb266a79bca:

   ARM: zynq: Use recommended dma-controller name instead of dmac (2023-01-19 
14:02:13 +0100)

----------------------------------------------------------------
ARM: Zynq DT changes for v6.3

- Fix node names to be aligned with dt schema
- Describe qspi controller
- Use xlnx prefix for ethernet IP

----------------------------------------------------------------
Harini Katakam (1):
       ARM: dts: zynq: Add xlnx prefix to GEM compatible string

Michal Simek (2):
       ARM: zynq: Comment interrupt names IRQs for pl330
       ARM: zynq: Use recommended dma-controller name instead of dmac

Steffen Trumtrar (1):
       ARM: dts: zynq: add QSPI controller node

  arch/arm/boot/dts/zynq-7000.dtsi | 24 ++++++++++++++++----
  1 file changed, 19 insertions(+), 5 deletions(-)


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs

