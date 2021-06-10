Return-Path: <SRS0=gFkl=LE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D808EC48BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jun 2021 22:28:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1E4C613DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jun 2021 22:28:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1E4C613DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZWAP0/EBEfO5GQSFVawi7GAQP7ODkUrgbq0zB5lzQc0=; b=zY2s3j3rlgUnUa
	Rdfvf21qCLUXE28xjJ5lVq7B19joW0uLaiGH6WcaHwIN5KxeqPtn2PLAAbKNAS+BXMDy5aGXWv7ou
	xCOyQkMEIKnZsgEPmNrxb+Da/CumFj/yD+Nq4uJupKVFSSfDgYkHS8VkSB0QkPvRfPGLm1rEco4Y+
	/f4pBnVjOyNQ59XgCB8j4Fvgkch9YhwNpyMw8HVhDlS6cjpxs1m11wzBvc6OzDNH44kelkcX9v/nZ
	HSIxismNXdG+yBoUxO/sqve94gdTo/igP5zhGTnw+epEI/DX32AkxCmLvbS0hW9m6S1DjFs5UXNci
	g6DdIgFptT7BSqcTD5xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrT6K-002lKg-CC; Thu, 10 Jun 2021 22:24:36 +0000
Received: from mail-lj1-f171.google.com ([209.85.208.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrT6G-002lJR-Bj
 for linux-arm-kernel@lists.infradead.org; Thu, 10 Jun 2021 22:24:33 +0000
Received: by mail-lj1-f171.google.com with SMTP id bn21so7044123ljb.1
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 10 Jun 2021 15:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=upPFWARj1vHFZRQDqKP9hbOCIWJSnJnB+X/H1bZtVZg=;
 b=g45/6eODNvJclK52BVGTTwaCQ4UNflJcKE+AuAReDKd8eph+m6ltQYmKB59c5igYZL
 1gD0Yjjv57p0Z/7X6/qveb4gFGHjdkb0l8OYOdj8KOoJn09BsHLFteUDOWmlKFZsQ61p
 xcMlHi8cIkeaXaOm2i/9niGGoC5EJclbJdQBNk0ns0zzgU5E1SuemWZAMAxyUTmdc4N7
 IJmrh7xfSRoQaA3IvdYUfhvAtn8xf1dO+oFX8XNE/0xT8tYdAvFSjTFJHJkuVIciN/FN
 ktyIlH3sV8kBOoTEKCWAIaroKVW7tQWEMTGzfRFkIJIwP6NTxldeODZq4km93jhQXITD
 oKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=upPFWARj1vHFZRQDqKP9hbOCIWJSnJnB+X/H1bZtVZg=;
 b=rmFaBMbSEdwLG+V4sKR0Q3+xW69OD/mEuU/YXXgdySxqXG6klh5Hp7Hvdc0USvENuo
 /XtqcNX43STh5hp2zgmFP7QeQDjRjCDhFluxP+6Jck4ol8eWoIXuTOHVTR6chXzmVlNA
 7PsMwNwm20vls5PbV0CHRb6SDYBbtTUMFkrl1YQanlLK40xVLb1IjyEBHw8IyDa+NMyr
 C/kAWZApqWyu5n6HfEpN1SCy1qhJh+C4dC6QnGC6JFZEMgtjiBHuavu3h1FdU0w5kmUY
 aydxfp564rq0VpSyM2E3qeKsg5o10oD3+FuIC/aSiySeDZ+GQmMR3/N0n//vA2Kg8exh
 yxwg==
X-Gm-Message-State: AOAM533OO/sWt6G1MUhqErzWq0TXbav9RnpFrgWcPyfmv6/6HutBwCBr
 XaWnorb/8LAjstwQcTLTMU+QUsGEM2q6db0TItIrvw==
X-Google-Smtp-Source: ABdhPJx5i3to20WSxsPuB0EMWt578arivcS9fjm0W2+N5fF7i+MzOS7H+lQYCH1VimMHY+ePknYf1mp/34cFgGAAwkU=
X-Received: by 2002:a05:651c:1057:: with SMTP id
 x23mr529393ljm.467.1623363810175; 
 Thu, 10 Jun 2021 15:23:30 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jun 2021 00:23:19 +0200
Message-ID: <CACRpkdYh9kZJU6PAxghPRGBco_61wRZgUnTZr_3qvySPCo5rBw@mail.gmail.com>
Subject: [GIT PULL] Ux500 DTS changes for v5.14
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Sebastian Reichel <sre@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_152432_438199_F537356D 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210610222319.VUXdkSGl9c4hi6ulrR4pstdrL7l-wxh5gKHWe_ZrU14@z>

Hi SoC maintainers,

here is a collection of DTS changes for the Ux500 platform that
have been circulated on the list, please pull them in!
Details in the signed tag.

Thanks,
Linus Walleij

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ux500-dts-v5.14

for you to fetch changes up to e409c1e1d5cb164361229e3a3f084e4a32544fb6:

  ARM: dts: ux500: Fix orientation of Janice accelerometer (2021-05-24
01:19:27 +0200)

----------------------------------------------------------------
Some Ux500 DTS updates for v5.14:
- Fix interrupt cells, GPIO controller node names in accordance
  with new YAML schemas.
- Add proper compatible strings for Broadcomm Wifi and BT.
- Fix upp and add some mount matrices for accelerometers so
  e.g. UI:s work as they should.
- Drop the DRDY pin assignment for a non-existing pin on a
  magnetometer.

----------------------------------------------------------------
Linus Walleij (5):
      ARM: dts: ux500: Fix orientation of accelerometer
      ARM: dts: ux500: Drop drdy pin assignment from magnetometer
      ARM: dts: ux500: Fix some compatible strings
      ARM: dts: href: Mount matrices for TVK R2
      ARM: dts: ux500: Fix orientation of Janice accelerometer

Sebastian Reichel (2):
      ARM: dts: ux500: Fix interrupt cells
      ARM: dts: ux500: Rename gpio-controller node

 arch/arm/boot/dts/ste-ab8500.dtsi              | 28 +++++++++++++-------------
 arch/arm/boot/dts/ste-ab8505.dtsi              | 24 +++++++++++-----------
 arch/arm/boot/dts/ste-href-ab8500.dtsi         |  2 +-
 arch/arm/boot/dts/ste-href-tvk1281618-r2.dtsi  |  6 ++++++
 arch/arm/boot/dts/ste-href-tvk1281618-r3.dtsi  |  4 +++-
 arch/arm/boot/dts/ste-href.dtsi                |  2 +-
 arch/arm/boot/dts/ste-snowball.dts             |  2 +-
 arch/arm/boot/dts/ste-ux500-samsung-golden.dts |  3 ++-
 arch/arm/boot/dts/ste-ux500-samsung-janice.dts | 11 +++++-----
 arch/arm/boot/dts/ste-ux500-samsung-skomer.dts |  3 ++-
 10 files changed, 47 insertions(+), 38 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
