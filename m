Return-Path: <SRS0=C417=NE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01599C432BE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Aug 2021 13:16:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4EBE61038
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Aug 2021 13:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C4EBE61038
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VE5+5k4p+hJnQdZtZhSAGqavBKWnTEz3Kh3UOhM7QMg=; b=zsP2Z/jMTM/4su
	7iXQpUpKlj8qgyEdGZGU0gZBCT9q2Zr0PP6ZiKqO+2w2DUaF7EIJfpXwQB8ypGYbIZNj0vwp8rJkD
	QZPBmrAUUcPQz7nJ0+F/54Ql6Cfd7NnVw5L9Vjkn//WRAcCaOSAOZOXXTyy/+krG204rdqwi7kP0M
	ChVfKSNyyczM2xVK751nf5nwcqjej85KbbbstxDsA+cKXNcRR+U5efS8xcTwufmXGIUuPZsscHyme
	vbCSH1iIaAbDDkhy527IIuKv/RIqmaIIHN8/wc6SeQHDs+sRPzqb1FPL3THlBF5RjvrxHdlKUkJTV
	rjQziWjB6filTrr5zuVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEX0u-00CfjQ-VI; Fri, 13 Aug 2021 13:14:21 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEX0p-00Cfik-5c
 for linux-arm-kernel@lists.infradead.org; Fri, 13 Aug 2021 13:14:19 +0000
Received: by mail-lj1-x231.google.com with SMTP id n6so15544193ljp.9
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 13 Aug 2021 06:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=fZrNlLT/RWdvESZ/y2yWWKipT3p/vZez077tIFMmytU=;
 b=XESAZYMLWW/CKDQ4szJfJvKSgHQRAEjj5Wadk3bIYLBMTlU3UzPP9E2gbay+V4Vu9v
 q5sWyxOHY1FaXYTDeDRs0IR7P7nbADiZl3epuIGrw87BkIlU7eLcXgmurt68QBRl2WM9
 KMXPfMir/PtEqNBYtS7FwdAT2cA4HPr8aK2bl7Lj0C81pataKvhLN/UagQ3v2WrPNK+7
 lbifJXGKZJY3RRNM03iqg+/g/vyBNWmG17Tewfi611tFR7H9RL/005NcOMq43qENR7hn
 e3SNg2QXRq4DjLIvu6lKYjshl5QG8/ou9j3LzjrqE36hmuLrNJf3yRQSJx0v4TXKoVq3
 nMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=fZrNlLT/RWdvESZ/y2yWWKipT3p/vZez077tIFMmytU=;
 b=ZtHB0xYoJQoNaXA0lGribqs3jS2aC87TG0afCAIDwdzFJA1AXhggYSa+JYv5qV9Z6P
 vrAKpbdrT0JnOSquom0kFUdG/SOQjlrMMRMMdH293mMcKIby4smfUBDOqpTLHnREX0gE
 jfDoAthEz1fPXzls9IYi+YzYjZ/h/baOlfkh/5c67JnNbFZEMJ8quSvOn9qA+0Gfiowj
 9aS3m52IYQieoA95oYx0s0ihTsRkK9Y976OxEtIpycXsZzTraEtZ+aMRKCz3WJ0em9Zx
 jiSMF0CJKogXsDBzQF+F5EMOG3ad1yPwr5yJ5vVWnnExZ/Nl905zCsaP6PH9gSV2KTgK
 sAhg==
X-Gm-Message-State: AOAM533bfOOiR6UZKZzzMImUjl+MLlkEuCRiF9XxQCUqafyIV2FdLAcR
 adg8u3QnkL71vG+6S4wXecQEIwsQ8+6SwWDEVMkH0Q==
X-Google-Smtp-Source: ABdhPJxYJuOxoN7gf6pI0ZP7Wy6xUKSduLokOT4dIw5SK/daajT4c3Nd3T1Z6HWcl3ipQFiOAtBHurvLRcHy/Zd20D4=
X-Received: by 2002:a2e:9e46:: with SMTP id g6mr1842380ljk.326.1628860452187; 
 Fri, 13 Aug 2021 06:14:12 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 13 Aug 2021 15:14:01 +0200
Message-ID: <CACRpkdY=sPDkzmbmm+0UQnJi7BXZKH14GLmyVwKC+4cLCJpmdA@mail.gmail.com>
Subject: [GIT PULL] Delete IXP4xx boardfiles replaced by device trees
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Imre Kaloz <kaloz@openwrt.org>, Zoltan HERPAI <wigyori@uid0.hu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_061415_262837_C354D17F 
X-CRM114-Status: GOOD (  18.41  )
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
Message-ID: <20210813131401.lWKHHkO2s78XPv-gyNOLetD7VjLig3J4uyEm_rgjpxY@z>

Hi SoC folks,

this concludes the first big chunk of IXP4xx cleanup and DT conversion
by deleting a majority of the boardfiles now supported by the device
trees.

The details of which boardfiles are deleted and the two that are kept can
be found below. The idea is that all devices except the Omicron ones
will keep being supported, but as device trees. Omicron has publicly
stated that they have no interest in keeping supporting the boards,
if someone anyway steps up and need them, scratch device trees
exist on the mailing list.

Since there were a few Kconfig fixes in this rc-phase some collisions
could occur in Kconfig. But I hope not.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ixp4xx-del-boardfiles-v5.15

for you to fetch changes up to b71377b3e1e08bf1e7e3dbbe4ee7aa07971552dc:

  ARM: ixp4xx: Delete the Freecom FSG-3 boardfiles (2021-08-13 14:52:12 +0200)

----------------------------------------------------------------
This deletes the following IXP4xx boardfiles:

- NSLU2
- NAS100D
- D-Link DSM-G600
- Omicron
- Gateway WG302v2
- Arcom Vulcan
- Avila
- Intel reference designs
- Coyote and IXDPG425
- GTW5715
- Freecom FSG-3

In each case except Omicron, the board has been replaced by
a corresponding device tree and tested where someone
volunteered: Marc Zyngier has tested Arcom Vulcan and Freecom
FSG-3 and I have tested NSLU2 and Avila for example. All
that were tested boot to prompt, some devices may need some
more massage before working perfectly.

We can just as well delete these board files because we are
confident that we will fix them to a working state if people
are able to test patches.

I am holding back the following boards for now:

- Gateway 7001 - because Zoltan is working on this board and
  needs more time. He might need to test things with the board
  file so let's allow him time for that.

- Goramo MLR - the consensus is to replace this with a dry
  coded device tree, but the bindings for that tree need some
  more time to make so we keep the boardfile around until
  we can merge a complete device tree for it.

After these two (target v5.16) we can delete the remaining
board files and the old mach structure along with the old PCI
driver.

----------------------------------------------------------------
Linus Walleij (11):
      ARM: ixp4xx: Delete NSLU2 boardfiles
      ARM: ixp4xx: Delete NAS100D boardfiles
      ARM: ixp4xx: Delete the D-Link DSM-G600 boardfiles
      ARM: ixp4xx: Delete Omicron boardfiles
      ARM: ixp4xx: Delete Gateway WG302v2 boardfiles
      ARM: ixp4xx: Delete the Arcom Vulcan boardfiles
      ARM: ixp4xx: Delete Avila boardfiles
      ARM: ixp4xx: Delete Intel reference design boardfiles
      ARM: ixp4xx: Delete Coyote and IXDPG425 boardfiles
      ARM: ixp4xx: Delete GTWX5715 board files
      ARM: ixp4xx: Delete the Freecom FSG-3 boardfiles

 arch/arm/mach-ixp4xx/Kconfig          | 158 ---------------
 arch/arm/mach-ixp4xx/Makefile         |  26 ---
 arch/arm/mach-ixp4xx/avila-pci.c      |  79 --------
 arch/arm/mach-ixp4xx/avila-setup.c    | 210 --------------------
 arch/arm/mach-ixp4xx/coyote-pci.c     |  62 ------
 arch/arm/mach-ixp4xx/coyote-setup.c   | 144 --------------
 arch/arm/mach-ixp4xx/dsmg600-pci.c    |  77 --------
 arch/arm/mach-ixp4xx/dsmg600-setup.c  | 304 -----------------------------
 arch/arm/mach-ixp4xx/fsg-pci.c        |  73 -------
 arch/arm/mach-ixp4xx/fsg-setup.c      | 311 ------------------------------
 arch/arm/mach-ixp4xx/gtwx5715-pci.c   |  72 -------
 arch/arm/mach-ixp4xx/gtwx5715-setup.c | 167 ----------------
 arch/arm/mach-ixp4xx/ixdp425-pci.c    |  75 --------
 arch/arm/mach-ixp4xx/ixdp425-setup.c  | 339 --------------------------------
 arch/arm/mach-ixp4xx/ixdpg425-pci.c   |  56 ------
 arch/arm/mach-ixp4xx/miccpt-pci.c     |  75 --------
 arch/arm/mach-ixp4xx/nas100d-pci.c    |  73 -------
 arch/arm/mach-ixp4xx/nas100d-setup.c  | 353 ----------------------------------
 arch/arm/mach-ixp4xx/nslu2-pci.c      |  69 -------
 arch/arm/mach-ixp4xx/nslu2-setup.c    | 341 --------------------------------
 arch/arm/mach-ixp4xx/omixp-setup.c    | 298 ----------------------------
 arch/arm/mach-ixp4xx/vulcan-pci.c     |  70 -------
 arch/arm/mach-ixp4xx/vulcan-setup.c   | 282 ---------------------------
 arch/arm/mach-ixp4xx/wg302v2-pci.c    |  60 ------
 arch/arm/mach-ixp4xx/wg302v2-setup.c  | 114 -----------
 25 files changed, 3888 deletions(-)
 delete mode 100644 arch/arm/mach-ixp4xx/avila-pci.c
 delete mode 100644 arch/arm/mach-ixp4xx/avila-setup.c
 delete mode 100644 arch/arm/mach-ixp4xx/coyote-pci.c
 delete mode 100644 arch/arm/mach-ixp4xx/coyote-setup.c
 delete mode 100644 arch/arm/mach-ixp4xx/dsmg600-pci.c
 delete mode 100644 arch/arm/mach-ixp4xx/dsmg600-setup.c
 delete mode 100644 arch/arm/mach-ixp4xx/fsg-pci.c
 delete mode 100644 arch/arm/mach-ixp4xx/fsg-setup.c
 delete mode 100644 arch/arm/mach-ixp4xx/gtwx5715-pci.c
 delete mode 100644 arch/arm/mach-ixp4xx/gtwx5715-setup.c
 delete mode 100644 arch/arm/mach-ixp4xx/ixdp425-pci.c
 delete mode 100644 arch/arm/mach-ixp4xx/ixdp425-setup.c
 delete mode 100644 arch/arm/mach-ixp4xx/ixdpg425-pci.c
 delete mode 100644 arch/arm/mach-ixp4xx/miccpt-pci.c
 delete mode 100644 arch/arm/mach-ixp4xx/nas100d-pci.c
 delete mode 100644 arch/arm/mach-ixp4xx/nas100d-setup.c
 delete mode 100644 arch/arm/mach-ixp4xx/nslu2-pci.c
 delete mode 100644 arch/arm/mach-ixp4xx/nslu2-setup.c
 delete mode 100644 arch/arm/mach-ixp4xx/omixp-setup.c
 delete mode 100644 arch/arm/mach-ixp4xx/vulcan-pci.c
 delete mode 100644 arch/arm/mach-ixp4xx/vulcan-setup.c
 delete mode 100644 arch/arm/mach-ixp4xx/wg302v2-pci.c
 delete mode 100644 arch/arm/mach-ixp4xx/wg302v2-setup.c

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
