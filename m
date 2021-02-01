Return-Path: <SRS0=ZBoG=HD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA1BCC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Feb 2021 10:31:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7549564DD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Feb 2021 10:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7549564DD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z9b56MMGE/w0QsgqfYf25PSKGhhuKnvE89/HI6lsB9g=; b=kXuUGFunF2s/PMLLXPR1i7gxUF
	1W479ttZw7Q8xS7Tc2cBDRsO0DJYmG75/fXLtAGp+1WPjWM2yx+ViZ0VaCt0PmZ9w4kw+5aq1LV9O
	d29CHahmufGprXYY75e3u+FcWR9hOgrWkgtOXRl3BSI/Tq/03ukggc/ieJhx2qp4Xq/liHRFNOOWm
	v5fA/st9cs2TTQyz1HlBNAVfeMJhoMwBsFeOHtkji50OXZPFcZvDbkLSbYX5vebGO+8wS4HSH66B7
	7rvziD1aSY7IS0/06rUbuKVsCpCbiQoKAiKaK27N9PJ2ygIywXMwenkfGO+oXTav5/0AOJ+/qzkCz
	pl0zhphA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6WTj-0008E3-QM; Mon, 01 Feb 2021 10:30:43 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6WC5-0006h1-Dt; Mon, 01 Feb 2021 10:12:31 +0000
Received: by mail-wr1-x432.google.com with SMTP id g10so15921424wrx.1;
 Mon, 01 Feb 2021 02:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=QpxNtNbna4Scltna+Nb6lMeZ0gHBJTYgia9t/bkI6Zs=;
 b=opI0B60cn7stle5LAAHoczgTI/0TODtirP6jlFWz/0ABOCvPdBzMoU7UoIyvLywx3d
 gD5Nb9aSUwazeEhA93xs8zyQqne1acq5GGryY8VwCrqXdbfhrHJQTAv4W8fl2tid5u99
 wK4MzMbGgxD6RYThZ9iY3mYmZafJVKSNfXKhaxl4OqyW28Ghhd9wLATMWj3TRh7DaMou
 DzGgWnWInHAJ8bOm8BrZX3Eehas//UBKrcbAOHavgebciYPtasraZdzYMQ3XSlgToXcF
 upPPlTPiJRCcjyItGf9/yIWt9epbRaIXl5EmATvqJYoVe5Oe2ihYw5Eg49FgHQucoNmq
 TCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=QpxNtNbna4Scltna+Nb6lMeZ0gHBJTYgia9t/bkI6Zs=;
 b=K9UvhzIOj9f1obpa/ZkoaBTC16xKr5wDzDsXXJ8gCtYbmwsdKx+//a1T8wX7os0QX1
 uJf81MEKvjUDFStbVXdrZq2wIKnwfmcNicxbJSMEjtxL4yeAy2xztYgvaoKBC3RcBYpQ
 p/iPoLlLX5U6a5NlktwVcKzFe/nxTO7/e9ula6UpnLP31zRDE4rYuA2YTchTo7doY1Fl
 r6MH3teFDflbDf8SQMeFnlDANZj0rBRYO+tU4vnU7Cib+UvsBgUJbeMF5DMHL3EapkR0
 5qeQy+kVKSPDhR7VKD9iqbqF8PoreWyiVqQefmu1g3mj6QCFrGTXT+Bk8uoF6aVfrajk
 ZIMg==
X-Gm-Message-State: AOAM532D85Y/gMD/9h+H3LIvrEEu9vtO9dhfE2fXWREMKfzQ1mBWQb7O
 jf5AEt65YiMFVY4HJTy7FV0=
X-Google-Smtp-Source: ABdhPJxZz4ds0zipa2CrBlxfV5OmoWiYePP7VyYh3ZBX28tShz97Q6Ozhp5ECqTMej7yM6ZpUN4VbA==
X-Received: by 2002:a5d:4988:: with SMTP id r8mr17433084wrq.26.1612174348382; 
 Mon, 01 Feb 2021 02:12:28 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id j7sm2286301wrp.72.2021.02.01.02.12.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 02:12:27 -0800 (PST)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] arm64: dts: mediatek: updates for v5.12
Message-ID: <565be0cc-460a-7d0b-47da-09bf0401e8fe@gmail.com>
Date: Mon, 1 Feb 2021 11:12:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_051230_189454_6941C5E3 
X-CRM114-Status: GOOD (  20.51  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: James Liao <jamesjj.liao@mediatek.com>, Argus Lin <argus.lin@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Bayi Cheng <bayi.cheng@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Neal Liu <neal.liu@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210201101226.QMvb5NhBXkyuZ4pvlKe0l9d3rjsXfvWuJO79yntzCfk@z>

Hi Olof and Arnd,

Please find below the updates for the MediaTek dts64.
Lots of work is done in the MT8183 SoC which can be found in some newer
Chromebooks, especially around grafics support. Not so much is happening on the
shiny new MT8192, as we still lack some core drivers, which provide a lots of
dependencies.

Apart from that we support two new devices for the MT6779 from the mobile chip
line. One is a SoC specific device called DEVAPC. It provides a kind of bus
firewall which will pass information on potentially malicious bus accesses from
TF-A to the SoC. It had been a long journey for the driver and I'm happy that it
is now supported by the device.

On the IoT side of the chips we now have support for the APDMA controller for
the MT8516 UARTs.

Regards,
Matthias

---
The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.11-next-dts64

for you to fetch changes up to 18d6e3f6744d6105ab61de790170cb60534eeebc:

  arm64: dts: mt8183: Fix GCE include path (2021-02-01 09:48:19 +0100)

----------------------------------------------------------------
mt6779:
- add DEVAPC node to detect mallicious bus accesses
- add PMIC wrapper node

mt7622:
- add reset to mmc node

mt8183:
- fix typo in drma-fifo-size property
- refine compatible for the disp-gamma
- add phandel of PM domain to the PWM node
- add second PWM node
- add regulator to MFG power domain
- enable DSI node in kukui
- add krane sku0, which uses different panel
- fix mailbox dt-bindings include path

mt8192:
- add NOR flash node
- add PSCI based CPU idle states

mt8516:
- add node for the UART's APDMA controller

----------------------------------------------------------------
Argus Lin (1):
      arm64: dts: mt6779: Support pwrap on Mediatek MT6779 platform

Enric Balletbo i Serra (1):
      arm64: dts: mt8183: Add missing power-domain for pwm0 node

Fabien Parent (3):
      arm64: dts: mediatek: mt8183: add pwm node
      arm64: dts: mediatek: mt8183-evb: add PWM support
      arm64: dts: mediatek: mt8516: add support for APDMA

Frank Wunderlich (1):
      dts64: mt7622: fix slow sd card access

Hsin-Yi Wang (4):
      arm64: dts: mediatek: mt8183: Add domain supply for mfg
      arm64: dts: mt8183: config dsi node
      arm64: dts: mt8183: Add krane-sku0 board.
      dt-bindings: arm64: dts: mediatek: Add krane sku0

James Liao (1):
      arm64: dts: mt8192: Add cpu-idle-states

Matthias Brugger (1):
      arm64: dts: mt8183: Fix GCE include path

Neal Liu (1):
      arm64: dts: mt6779: Support devapc

Yongqiang Niu (2):
      arm64: dts: mt8183: rename rdma fifo size
      arm64: dts: mt8183: refine gamma compatible name

bayi cheng (1):
      arm64: dts: mt8192: add nor_flash device node

 .../devicetree/bindings/arm/mediatek.yaml          |  4 +-
 arch/arm64/boot/dts/mediatek/Makefile              |  1 +
 arch/arm64/boot/dts/mediatek/mt6779.dtsi           | 17 +++++++
 arch/arm64/boot/dts/mediatek/mt7622.dtsi           |  2 +
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts        | 12 +++++
 .../boot/dts/mediatek/mt8183-kukui-krane-sku0.dts  | 23 +++++++++
 .../dts/mediatek/mt8183-kukui-krane-sku176.dts     |  5 ++
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     | 46 +++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           | 26 +++++++---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi           | 57 ++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8516.dtsi           | 30 ++++++++++++
 11 files changed, 216 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dts

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
