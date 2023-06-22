Return-Path: <SRS0=Gilr=CK=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28950EB64D8
	for <soc@archiver.kernel.org>; Thu, 22 Jun 2023 08:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF33AC433C0; Thu, 22 Jun 2023 08:10:56 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D2DA4C433C8
	for <soc@kernel.org>; Thu, 22 Jun 2023 08:10:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D2DA4C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f9c532fa45so13471215e9.2
        for <soc@kernel.org>; Thu, 22 Jun 2023 01:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687421454; x=1690013454;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E6E/DKjP8bIO9nlNl0dJE1KVK22hxgPcNnONiA41pro=;
        b=gznygwPGC1pXzExG36qSookApcXSWC8V8JkfWObvXUwxiWWqt83zwo63bOaBkQmMEq
         UkL85J0FDWpWJE4VaZxBS+LqP/fEqSjnbMw34MpcF/hJlNUJnPkR7auMLJygD4y8QUw+
         Ekj8PUSzan5R5f21XVWtQIIFB7GTtILqZAUEDkmpOhaeo26MAxhPgrzIYXFCpZSwKivF
         xjbPbdAZgC9hoTAtFrTpxc3hBWditVZwxtRpnaKzkpfuTaOfSSZa2BEhu1CB7K/S4yuR
         jkEdLfNO2iXMwYkJ7eQsUVjTRyoUql9+o+L/cLD7pPXS3rmz/InjXEHAUjEbZuupWx+3
         nqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687421454; x=1690013454;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E6E/DKjP8bIO9nlNl0dJE1KVK22hxgPcNnONiA41pro=;
        b=iBfbiH0l2e/fYr0e62JplAQ1c7P3FoHDlcN2/AsNiSgK/vZ8I5I5lrRoRlONU73cGC
         AUuMZvk1M+yMMKUCtpgzfryWwhZLN2/AJBtZK8qryBtGujdJ84C+vQIpXEx3fdDMLuTo
         X+nHQHrXHKPUTIw/3IXz8Q5Clu/ZcD57AGsNLojIQG239cJL9KHI0IKTgxah6VvG+22g
         wlXmmJJNWgYhESFdGG7fQyJrPXqtOUtXWg8lN2NOiImNZOqeJfUqw5Xh+5O3EMe5B1OF
         MFJepXLQ8Rvu59jepxQkEhVHTyyhclyXqyH02Y35B1BJVkvFe+VySvc5FgEhf98Qfn/9
         r0KA==
X-Gm-Message-State: AC+VfDwtTvOy9R+gjkP3nJN/i7voOOVBtRgXrkuSUSgi3LeO3/VZl4pX
	DqwByV62J5wpNBDNNJU9LHwwTahdGjvPmMiUjp0bYw==
X-Google-Smtp-Source: ACHHUZ55OPiQl2bI3ECC95oo1SQkENMW+Ehw8FL52KPlnvb0Op00znXJhgk2lQtMgl1Nu26ZRi18cg==
X-Received: by 2002:a05:600c:214d:b0:3f9:ad7:ae86 with SMTP id v13-20020a05600c214d00b003f90ad7ae86mr9011643wml.37.1687421453816;
        Thu, 22 Jun 2023 01:10:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f692:a800:4794:385? ([2a01:e0a:982:cbb0:f692:a800:4794:385])
        by smtp.gmail.com with ESMTPSA id z11-20020a7bc7cb000000b003f5ffba9ae1sm7023861wmk.24.2023.06.22.01.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 01:10:53 -0700 (PDT)
Message-ID: <a10ea420-7599-3f41-dfd8-1742ef436ca0@linaro.org>
Date: Thu, 22 Jun 2023 10:10:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic late Drivers updates for v6.5
Reply-To: neil.armstrong@linaro.org
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Organization: Linaro Developer Services
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's a late Amlogic Drivers changeset for v6.5, with includes
a low priority fix for secure-pwrc, a MAINTAINERS fix and a bindings yaml
conversion patch that were lying on the lists for too long.

Neil

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git amlogic-drivers-for-v6.5

for you to fetch changes up to 6b0139b372d40bd5dafc140b6618b57d13211168:

   dt-bindings: interrupt-controller: Convert Amlogic Meson GPIO interrupt controller binding (2023-06-20 09:41:07 +0200)

----------------------------------------------------------------
Amlogic Drivers changes for v6.5:
- tag some powers domains as always-on for secure-pwrc
- fix MAINTAINERS entry for PHY drivers & bindings
- Amlogic Meson GPIO interrupt controller binding to yaml conversion

----------------------------------------------------------------
Alexey Romanov (1):
       drivers: meson: secure-pwrc: always enable DMA domain

Heiner Kallweit (2):
       MAINTAINERS: add PHY-related files to Amlogic SoC file list
       dt-bindings: interrupt-controller: Convert Amlogic Meson GPIO interrupt controller binding

  .../amlogic,meson-gpio-intc.txt                    | 38 ------------
  .../amlogic,meson-gpio-intc.yaml                   | 72 ++++++++++++++++++++++
  MAINTAINERS                                        |  2 +
  drivers/soc/amlogic/meson-secure-pwrc.c            |  2 +-
  4 files changed, 75 insertions(+), 39 deletions(-)
  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
