Return-Path: <SRS0=WGdq=M2=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D8BC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Aug 2021 12:53:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0A7760525
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Aug 2021 12:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D0A7760525
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=czlXEKjHlru9n1hcAkBCj7gP6XmLx7KmknDQaob3hko=; b=R1f5yl3VTnZH0Y
	JlnhPlt3PEmgx1NuLrjhMpQpWz6znoxli5629Ali5+FiFTlnqZfrpiQ+ZhDeFyNOn0CvG4NicR+Pl
	N26UtsfLgY2ouSRDacNCft5z5AQouBA8bTSlGed/OTF9JGAE2QEmMIbx/NgimX6/30FmkOxi8cj75
	lQzpOYDYowi7nkp7F9dAYC15W8B8dogci6l3IyPyvle8emwGkCMkTVCyr7Bac0K7n15gCEJN+5+3v
	u4QL4a+6j2MjeWNuMnC9E+J6EnHLbtFVhSx3b9FBr5f7W8hxSuP+6EQyPtPgQn7e7SlPiZDFtEH9T
	obeCvaLthfUWsF3Ac8fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAtsf-002ktk-NC; Tue, 03 Aug 2021 12:50:51 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAtUC-002cXa-A4
 for linux-arm-kernel@lists.infradead.org; Tue, 03 Aug 2021 12:25:33 +0000
Received: by mail-lf1-x12b.google.com with SMTP id c16so9902555lfc.2
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 03 Aug 2021 05:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=2vR54FtkJtwvV/eZwBB/ZobftRPkYHq3z3g8svYKyt0=;
 b=Kmd8GuUKxsxY2kCMsI3QkoLIc6nPiuHs2150O1ehpcRAACni/vX1tio9Q3Lh8HIKZu
 RwfRr3XgQ2XOlRximm/Y3gAbjRGW5bID2E2GQVapLAz0GGAWD7QEgYFjfITc+ooan9+D
 b0sMUy3lrLirnNl0q3ZvqeOIrK9ctrluMJ8pNyyZ5TMldbaY9iUSWN+ShEF0NATZdJyd
 CK9s8XT5KLZkxw4ly5wUdOfMsQoDgsC/kz0ANOT+J8XwIkrmAt5FSOOgpDg8zC05A0E7
 4C0wIahYZZSBm4JOg7NRgoKyKjNdy37RreqGaeNJI1WF10I5GwNSkJtpPMlWzX75nP7I
 i7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=2vR54FtkJtwvV/eZwBB/ZobftRPkYHq3z3g8svYKyt0=;
 b=Jv1iXdaRUSE98W10knVpDKR8RKr0Vv7jfYqr5zeR50PeYGcYj2iLFfDyXmh0b4CFWN
 lvSYpk0jOfQd6D5tq9Y1UhHmHIMN12nD4w2uSiBD/bBG31DD685jXnDZiw/IIb0kH35q
 VJvM8mxd1fy5r0bQk+MxrmTJrhubYirhX8O8VkxB9kYH0RmxG9dMG0iJUprVqclQYRHx
 93OmeZP9j1xqwscKbJHxSCYfi77sxtEDo7DBIAEXySquE751j0unt51y2lukp9jVQLMt
 D9kmbOZYT5rb6UjzngJpGaG5jG/HXhXqg61pMMeySNubWkQ4K6xixAXOvcKsNVq2A7j0
 A/Gw==
X-Gm-Message-State: AOAM533JZ6zDjM0ef6+om85QK7CbdB90V8+OCJLbrw9Ig5o1ro7J9AAe
 gGl79i7+PIlyWz8ES3TEZwd9q44rxBkClKgXrlriNQ==
X-Google-Smtp-Source: ABdhPJzfzwbDtQbRpJA0lvEOFxyFr+49gj6LvtCiEn7lnxpwH4Opxs0V5dmvDLo1BTnA4twDZu7YON/6hSLUfKm4TY4=
X-Received: by 2002:a05:6512:1084:: with SMTP id
 j4mr4457478lfg.586.1627993525786; 
 Tue, 03 Aug 2021 05:25:25 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 3 Aug 2021 14:25:15 +0200
Message-ID: <CACRpkdbjBv5ywZZD8rK07d5sLcHsG8o4iYD-3jHO=HLg6-nKnA@mail.gmail.com>
Subject: [GIT PULL] Ux500 DTS changes for the v5.15 kernel cycle
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Stephan Gerhold <stephan@gerhold.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_052532_413140_0CA001F8 
X-CRM114-Status: GOOD (  15.17  )
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
Message-ID: <20210803122515.BZ0DQ0GI3aKjtYvBW24O7h-5iej9EqEEZBm4aeszVTc@z>

Hi SoC maintainers,

here is a first set of DTS changes for v5.15 that would be nice if
you could pull into the appropriate DTS branch in the SoC tree.

The details are in the signed tag, mainly some new phones,
and some generic fixes.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ux500-dts-v5.15-1

for you to fetch changes up to fe2fc0fd379371af510caf39181460f2eed4c35b:

  ARM: dts: ux500: Adjust operating points to reality (2021-08-02
01:41:59 +0200)

----------------------------------------------------------------
Ux500 Device Tree updates for the v5.15 kernel cycle:

- New device trees for these mobile phones:
  - Samsung Gavini
  - Samsung Codina
  - Samsung Kyle
- Flag eMMC cards as non-SD non-SDIO to save time
- Link USB PHY to USB controller in the device tree
- Fix up the operating points to the actual clock frequencies

----------------------------------------------------------------
Linus Walleij (5):
      ARM: dts: ux500: Add device tree for Samsung Gavini
      ARM: dts: ux500: Flag eMMCs as non-SDIO/SD
      ARM: dts: ux500: Add devicetree for Codina
      ARM: dts: ux500: Add a device tree for Kyle
      ARM: dts: ux500: Adjust operating points to reality

Stephan Gerhold (1):
      ARM: dts: ux500: ab8500: Link USB PHY to USB controller node

 arch/arm/boot/dts/Makefile                     |   5 +-
 arch/arm/boot/dts/ste-ab8500.dtsi              |   8 +-
 arch/arm/boot/dts/ste-ab8505.dtsi              |   6 +
 arch/arm/boot/dts/ste-db8500.dtsi              |   7 +-
 arch/arm/boot/dts/ste-db8520.dtsi              |   7 +-
 arch/arm/boot/dts/ste-db9500.dtsi              |   9 +-
 arch/arm/boot/dts/ste-dbx5x0-pinctrl.dtsi      |  18 +
 arch/arm/boot/dts/ste-href.dtsi                |   4 +
 arch/arm/boot/dts/ste-snowball.dts             |   2 +
 arch/arm/boot/dts/ste-ux500-samsung-codina.dts | 863 +++++++++++++++++++++++++
 arch/arm/boot/dts/ste-ux500-samsung-gavini.dts | 854 ++++++++++++++++++++++++
 arch/arm/boot/dts/ste-ux500-samsung-golden.dts |   2 +
 arch/arm/boot/dts/ste-ux500-samsung-janice.dts |   2 +
 arch/arm/boot/dts/ste-ux500-samsung-kyle.dts   | 664 +++++++++++++++++++
 arch/arm/boot/dts/ste-ux500-samsung-skomer.dts |   2 +
 15 files changed, 2438 insertions(+), 15 deletions(-)
 create mode 100644 arch/arm/boot/dts/ste-ux500-samsung-codina.dts
 create mode 100644 arch/arm/boot/dts/ste-ux500-samsung-gavini.dts
 create mode 100644 arch/arm/boot/dts/ste-ux500-samsung-kyle.dts

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
