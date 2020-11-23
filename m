Return-Path: <SRS0=45Hb=E5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F7FC56202
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2020 14:55:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DACBD20658
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2020 14:55:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ejpUMbCd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U5hr8MQn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DACBD20658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HdzBDH8z8YaQyJUBJZT5NKzlQlwdhrFjL79GbsciWbM=; b=ejpUMbCdZ8JLQHSIV2NnCExCsH
	z9KomMVyQJ0ss5MB/Cpp9h8QlgpXTBhjppK1hgcPNYNNRV90oPcYV9H4VFmqvyyVAlZjZpaJ67bXb
	6QNlDLCbvwPRnVCA3B9MbbWauuBXoOvOBEMZ9Zgm3Sp1KpQ+tqVBH4gcOe+fQU112CC8zan8ZU8vb
	olBpwtOCwyt+VKXKLLlYcYBNgrPDxAHfVflOqjKziUGus3sBPm/kSI0pze+BZ2ZaTdgGmEs54sXEO
	Wc2KuPgwq1rnOldc/0BvqaZ4Dvo6zVtwL3HR1a7s3OIrGAMWEFkHWxNy18st9ZCR9/ENTLVevDgXz
	gfxYFYXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khDEM-0002vq-E2; Mon, 23 Nov 2020 14:54:14 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khDEI-0002tx-14
 for linux-arm-kernel@lists.infradead.org; Mon, 23 Nov 2020 14:54:11 +0000
Received: by mail-lf1-x141.google.com with SMTP id r24so7975751lfm.8
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 23 Nov 2020 06:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=7YSHXXDe2F2P0TwtPFMPAjfiKJylj/0yhpHvRnXTUQs=;
 b=U5hr8MQnNH1kAeZCLlOSDCxEsQkeCYcB1qwpE9NzhFn5xqYpcjD5qnBbeJolaOmHeR
 xEGmm59hevz9Q42zc/r5g8Tj9dMGn4/LzryLqNBWT4fWlUghfcwktkIn46XmYzycIUqD
 +yPM+J0sRlb+az+FmRvECZFq2bcEkn66n5dPsm/QjnrM05nddyn9+e/USDZIL3p9p99K
 MmTaVxNAru9f/FwkyYfD6VKsM0DB2jjwDm2aOtWX6hWMdbXjhO0tFa7jo4bD8mcdqZW0
 ufRy/z6tMnvm2oQOh+FhU7TYAmBPoZzRhYVmUjk270N+MPs1XFjMNdm5pzu9pdOaw/iO
 RNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=7YSHXXDe2F2P0TwtPFMPAjfiKJylj/0yhpHvRnXTUQs=;
 b=edzgktdjTFsta+y58xLfLs0pt8vreKYj0Xvq5g2MDcUGuvAiSV4m9NEUGUcCXkn2Yg
 46HqemDcf7H0KpCa0BR2ntpS0S+gCZTNQOoHt7xezRFX7IWy/VPIcpkzCiNE8EvDQgxg
 tQ/39ATW6MKpyS/e1+O/lbn+WgX/OtB311caZP9tB71pTWEH59lWH+uKV8VPTHb93Jaf
 f1KlO1+HWKXYeKR4lUUOy4cZKDhPwTFE88YzNNMXDzAvmTzhPOXnX4MWImxGnMhF6h4Y
 OPmi3cdEgpjod0exlKVO23TuvEoLqqvK481NIThBevlt125hK5CZELJEJzWajz+RxD0c
 +CyA==
X-Gm-Message-State: AOAM532mfbVPSpX53dwB0UeuawqCqG9luQxAqyY6czrv9QAzyAGUmrJD
 PjQFrgb+PCI3SJUjwMF7SoiOAz4i4jsZhxNKwgDlFA==
X-Google-Smtp-Source: ABdhPJwTKDiYMNDeIJgBKKOjawBMqtNzCwY4G0Doxz58mG7r5FZThg/pWlKtStqPrfSgRbtkeV9zEjfFhI7GQB5d7KQ=
X-Received: by 2002:a19:5f11:: with SMTP id t17mr1765535lfb.572.1606143245774; 
 Mon, 23 Nov 2020 06:54:05 -0800 (PST)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 23 Nov 2020 15:53:55 +0100
Message-ID: <CACRpkdY_M4xj++QhRPqX6N3x9YmFNJkz70DnvBj7Ai-dOtCJSQ@mail.gmail.com>
Subject: [GIT PULL] Ux500 DTS updates for the v5.11 kernel
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_095410_150864_0FEB2920 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201123145355.EilvYjGvOXS-VjtQgzIb3IOFGneiB50wbBB735TWfUo@z>

Hi SoC tree folks,

here are some Ux500 DTS updates for the v5.11 kernel
cycle. Details in the signed tag!

Yours,
Linus Walleij

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-stericsson.git
tags/ux500-dts-for-v5.11-1

for you to fetch changes up to ef5704b535194fb98ee1ceb00f6952e2f01e39a6:

  ARM: dts: ux500-golden: Add proper supplies to touchscreen
(2020-11-23 15:36:17 +0100)

----------------------------------------------------------------
Ux500 DTS updates for the v5.11 kernels:

- Rename the DSI controllers to match the preferred
  schema.
- Pull down the SDI2 feedback clock on the Skomer.
- Add proper supplies to the MaxToch touchscreen on
  the Golden.

----------------------------------------------------------------
Linus Walleij (3):
      ARM: dts: ux500: Rename DSI controller nodes
      ARM: dts: ux500: skomer: Pull down SDI2 FBCLK
      ARM: dts: ux500-golden: Add proper supplies to touchscreen

 arch/arm/boot/dts/ste-ab8500.dtsi              |  6 +++---
 arch/arm/boot/dts/ste-ab8505.dtsi              |  6 +++---
 arch/arm/boot/dts/ste-dbx5x0.dtsi              |  6 +++---
 arch/arm/boot/dts/ste-href-stuib.dtsi          |  2 +-
 arch/arm/boot/dts/ste-href-tvk1281618-r2.dtsi  |  2 +-
 arch/arm/boot/dts/ste-href-tvk1281618-r3.dtsi  |  2 +-
 arch/arm/boot/dts/ste-ux500-samsung-golden.dts |  9 ++++++---
 arch/arm/boot/dts/ste-ux500-samsung-skomer.dts | 12 +++++++++++-
 8 files changed, 29 insertions(+), 16 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
