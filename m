Return-Path: <SRS0=8y+7=XG=baylibre.com=narmstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17909C43334
	for <soc@archiver.kernel.org>; Fri,  1 Jul 2022 08:12:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CF637C341C7; Fri,  1 Jul 2022 08:12:43 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 10EAEC341C6
	for <soc@kernel.org>; Fri,  1 Jul 2022 08:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 10EAEC341C6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f42.google.com with SMTP id s1so2022803wra.9
        for <soc@kernel.org>; Fri, 01 Jul 2022 01:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:to:cc:subject
         :content-language:organization:content-transfer-encoding;
        bh=nPLf+k62bR1v4UhKo16dcYa81QGxp+MYk5E2KS1E2v4=;
        b=dPi2XFHQLHaw79AdJB6i2Dto3gQXwJpTVHwjW92AZv6KduncIOr374aIm5s3Hv6xUw
         aOotoixBZR+aajy7DOdiy0UK6r2vYGc30Se041dSloaC1WSE8MLSV0kRsR3CKdCweuy5
         dx8v5wPlnPMBd9UmmRoFotAYllhaDodsseTEml5KRxiRz6a1ZaY1lJ7unmSyV9gM7lbg
         wcOa+ySNqOKSwdWay3T9UKE5K5MIhJEhYUnj6fOPHO73VguiYyKon7ap1k4pwI9WNMPw
         rtsZhyUGS0WlKJeIJJDAQSsStbHJKjvnEAjDdgKvRzMUQG8/Tbyu4HRLiH+NKEuopdvI
         7zZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from:to
         :cc:subject:content-language:organization:content-transfer-encoding;
        bh=nPLf+k62bR1v4UhKo16dcYa81QGxp+MYk5E2KS1E2v4=;
        b=WfoAS+1MkmBnzHO7tzIBjyWO5DjmD4BVjBezDRKIG5GuCjuDhPZd6mp8JylXxLKXVc
         qy76aBQJxIacZPtKYoat/Syxy0CR14dPaMOBnFV0zybuKWEPNrda9AitoTILYVlzxEny
         aqsLgyr68+uvjYYIbndP8zN47oIzs60VjYORVaUpIQGogzgXOgY1ebU2txC0m9ZgCuu5
         a45G9FLvZRlF2O5ZNOq7JY416qPEB/W7KaSjij1YKoZ7pte66AKN7teGxTSIIiBsOsWD
         cnPnjNdA7pat5NQ9JskflCqq1noRJ9JlWfAdusbW+jdIrJvQgNuXUVBfB9tnDSGW5Jco
         Ei1g==
X-Gm-Message-State: AJIora+DLEiRyhJKd4i9RDRmkE3lgOeqY1bGkH67ZqoSnWhR/+KbaMbv
	3BFcyItSQF8CLIWXdN4B5gC8N2U9uh1STxtM
X-Google-Smtp-Source: AGRyM1u7ohMizxo7sai0pTmDDDp6+3ZsvvczqWUyizJIj+zrRlxLaJhsXoGCs+n95cj5Q4/81hav6A==
X-Received: by 2002:a05:6000:1689:b0:21d:22d0:8e5e with SMTP id y9-20020a056000168900b0021d22d08e5emr12525533wrd.574.1656663160909;
        Fri, 01 Jul 2022 01:12:40 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:5d81:390:1737:2a33? ([2001:861:44c0:66c0:5d81:390:1737:2a33])
        by smtp.gmail.com with ESMTPSA id u3-20020a05600c210300b003a044fe7fe7sm9451117wml.9.2022.07.01.01.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 01:12:40 -0700 (PDT)
Message-ID: <9c8b8570-f20c-ce9a-8c6c-51fdadf7722c@baylibre.com>
Date: Fri, 1 Jul 2022 10:12:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
From: Neil Armstrong <narmstrong@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] amlogic ARM64 DT updates for v5.20
Content-Language: en-US
Organization: Baylibre
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's a set of Amlogic ARM64 DT changes for v5.20, with minor DT fixes, reset controller
node addition for the S4 SoC Family and FAN control for the GS-King-X Set-top Box.

Neil

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v5.20

for you to fetch changes up to b7bfbbbf72fcf95c9a58d6ad0e905de539fba025:

   arm64: dts: meson: add gpio-fan control to GS-King-X (2022-06-13 10:18:53 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v5.20:
- adjust whitespace around '='
- add reset controller node for Meson-S4 SoC
- correct gpio-keys properties
- align gpio-key node names with dtschema
- add gpio-fan control to GS-King-X

----------------------------------------------------------------
Furkan Kardame (1):
       arm64: dts: meson: add gpio-fan control to GS-King-X

Krzysztof Kozlowski (3):
       arm64: dts: amlogic: adjust whitespace around '='
       arm64: dts: amlogic: correct gpio-keys properties
       arm64: dts: amlogic: align gpio-key node names with dtschema

Zelong Dong (1):
       arm64: dts: meson: add reset controller for Meson-S4 SoC

  arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |  2 +-
  .../arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts | 27 ++++++++++++++++++++--
  .../boot/dts/amlogic/meson-g12b-gtking-pro.dts     |  2 --
  arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |  2 +-
  arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts |  2 --
  .../boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts    |  4 +---
  .../boot/dts/amlogic/meson-gxbb-wetek-play2.dts    |  4 +---
  .../dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts |  4 +---
  .../boot/dts/amlogic/meson-gxl-s905d-p230.dts      |  4 +---
  .../dts/amlogic/meson-gxl-s905d-vero4k-plus.dts    |  4 +---
  .../amlogic/meson-gxl-s905w-jethome-jethub-j80.dts |  2 +-
  .../boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts |  4 +---
  .../boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts   |  4 +---
  arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts     |  4 +---
  .../boot/dts/amlogic/meson-gxm-wetek-core2.dts     |  2 --
  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |  6 +++++
  arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts   | 10 ++++----
  17 files changed, 47 insertions(+), 40 deletions(-)
