Return-Path: <SRS0=BHr2=O3=baylibre.com=narmstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BCD6C433F5
	for <soc@archiver.kernel.org>; Thu,  7 Oct 2021 09:46:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6A80C6113E; Thu,  7 Oct 2021 09:46:36 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1566961090
	for <soc@kernel.org>; Thu,  7 Oct 2021 09:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1566961090
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f51.google.com with SMTP id e12so17192785wra.4
        for <soc@kernel.org>; Thu, 07 Oct 2021 02:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:subject:to:cc:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=iWTS7oHCoZVg5zouR9Tuoxsiq0YaEFJDM1al7WC4J3s=;
        b=buHVxDnV3f+pKmmTu04hbbcDB0DXwRJGVgwSKfUd9u9vif92QrQnEVe6GrRG+ktz4w
         wwie1c/3x2FezIA0SQGFgzZu8Zj/zzPViubHclsVok12znM7HKIDEI4LVcV52pzaZc/1
         k2VsUmS+KDF9yhkiYD+XSLM7k8cbo9GejkdPUJZtzHRitlgG6SJEBC/HtsWOzg6S5lcN
         FzRlH6zkUNAFf66QP9fkdDq/sxJWj1xGMaIbM1dezVvQUswKkSf9/F9N4LXhucCG+C7G
         ILnvcPXFw3EOlMUwKTaG3ne6j2hDIA29rLea+hl/Wjxk+x5vgyFAA8uopWVpVLIT9Biq
         /wCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=iWTS7oHCoZVg5zouR9Tuoxsiq0YaEFJDM1al7WC4J3s=;
        b=UPFpMleczIhrjTToIBnZsm1MdVxQyfUg4M6/GfqkcK1Ip7hk3S0saKE/U/f3upxGpw
         /JB0sw1VbxDLLEx4dUN1DHrl4b3VlW0SNlZQDdK5zZ7XISyrFLGtJSWIx2kfwWSgxKV9
         mKfLtFRvP+uYrGuXF4xgXUCT/1uGKep2xxHYRK/TSH7O1iJs5cFr3XPsAQQvC3cL4Yha
         3A7bjJDBne6jt5RtjmWxb7qI58TENlo0s5toGs73cIJryNAX1QIUZiMZ/8Sr1uG6RXM+
         JTx657ryqWnu3at3Y66nOv92CUCBDcRkoYHvgljZZAkK/9xylS69mxNuSr7vRB8uu02l
         hncA==
X-Gm-Message-State: AOAM531qdOFNASRqEt9AlAaiF4cwlte5oF+3aqOSmRpvCeOhZ1iqQaWz
	rrA6Wy3VnpVLNzq2TMzlQ+tRUw==
X-Google-Smtp-Source: ABdhPJyfwpiYZPK/OXR6nM8mVjfxSSxSIK82PCV2KMn51CsEL+5QgCymXGLRrUth7x9+Wyn6xFaxiQ==
X-Received: by 2002:adf:d1c4:: with SMTP id b4mr4122567wrd.233.1633599994546;
        Thu, 07 Oct 2021 02:46:34 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:4e6:6eee:3312:b574? ([2001:861:44c0:66c0:4e6:6eee:3312:b574])
        by smtp.gmail.com with ESMTPSA id w9sm1852001wro.93.2021.10.07.02.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 02:46:34 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] arm64: dts: amlogic updates for v5.16
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Organization: Baylibre
Message-ID: <cc0a3af0-b1b1-dbe1-f553-cf58a1c63d0b@baylibre.com>
Date: Thu, 7 Oct 2021 11:46:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

Here's a set of Amlogic ARM64 DT changes for v5.16, adding three new Boards:
- Radxa Zero
- Jethub D1 & H1 home automation controllers
with the corresponding bindings and some misc DT fixes & additions.

Neil

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v5.16

for you to fetch changes up to ecff7bab5c9c2e2b6f5739b328347e08415879ec:

  arm64: dts: meson-g12b-odroid-n2: add 5v regulator gpio (2021-09-21 09:24:14 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v5.16:
- New Boards (with bindings):
  - Radxa Zero
  - Jethub D1 & H1 home automation controllers
- Misc Changes:
  - add Ethernet PHY reset line for ODROID-C4/HC4
  - add audio playback nodes to rbox-pro
  - Fix the pwm regulator supply properties
  - meson-g12b-odroid-n2: add missing 5v regulator gpio

----------------------------------------------------------------
Anand Moon (4):
      arm64: dts: meson-g12a: Fix the pwm regulator supply properties
      arm64: dts: meson-g12b: Fix the pwm regulator supply properties
      arm64: dts: meson-sm1: Fix the pwm regulator supply properties
      arm64: dts: meson-g12b-odroid-n2: add 5v regulator gpio

Christian Hewitt (3):
      dt-bindings: arm: amlogic: add support for Radxa Zero
      arm64: dts: amlogic: add support for Radxa Zero
      arm64: dts: meson: add audio playback to rbox-pro

Dongjin Kim (1):
      arm64: dts: meson: sm1: add Ethernet PHY reset line for ODROID-C4/HC4

Vyacheslav Bocharov (4):
      dt-bindings: arm: amlogic: add bindings for Jethub D1/H1
      dt-bindings: vendor-prefixes: add jethome prefix
      arm64: dts: meson-gxl: add support for JetHub H1
      arm64: dts: meson-axg: add support for JetHub D1

 Documentation/devicetree/bindings/arm/amlogic.yaml |   3 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/amlogic/Makefile               |   3 +
 .../dts/amlogic/meson-axg-jethome-jethub-j100.dts  | 362 ++++++++++++++++++
 .../boot/dts/amlogic/meson-g12a-radxa-zero.dts     | 405 +++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts  |   2 +-
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts    |   2 +-
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts |   2 +-
 .../boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi   |   4 +-
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     |   6 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi   |   4 +-
 .../amlogic/meson-gxl-s905w-jethome-jethub-j80.dts | 241 ++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts |  61 ++++
 .../boot/dts/amlogic/meson-sm1-bananapi-m5.dts     |   2 +-
 .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |   2 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi  |   6 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts   |   2 +-
 17 files changed, 1096 insertions(+), 13 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
