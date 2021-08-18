Return-Path: <SRS0=NLw9=NJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EAFCC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Aug 2021 13:02:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA3E060EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Aug 2021 13:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA3E060EFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AAr3YPKI0xu4HlTDhndtB02xLK9k6gArSMCPjm+3w+g=; b=UKkyhyO7EFM00U
	D/AYPiAamigUA+tXbxN48vO09dKhXq/QbHBuR/V3y57P16bslv3TdfSwbu84GHqk/SsAysh8xs5XS
	qOm4WKpFwAvPs16CPHGtBXfPWcDyJmo0RljYS2jJvp/7TlwdeXsPdNgRbcNCpC+BSK/XnLvc9V7p0
	rLpIXlwOYpJBTtZ69oTGZB+WASZ/jkQ3EH1FE2Tt2PVSHmT3jXlw/uWehZw/mixc7zXkEHPnn+VTL
	NMlzcx/nDJ5dfbihkgplgBqL/KCUM2plAG4tqqQQIsaM004n7baJOnf1ewZlMzBlDRr+nkR/x7c3j
	guQlvwC6eBOgpr/TOFAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGLAi-005bIM-4G; Wed, 18 Aug 2021 12:59:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGLAX-005bFv-66
 for linux-arm-kernel@lists.infradead.org; Wed, 18 Aug 2021 12:59:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7AC5D6108D;
 Wed, 18 Aug 2021 12:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629291584;
 bh=kaFdSUB1vCXsW9txP2B+ZcDmzRL2H2ebjNpIqOXnAKA=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O+H4KtMOeXmtd71yTDxzaTF8RVIhEXVHiyefHb7N9xDqreoxyOz0/tap10CTQwWwj
 ohS7b5enBCDsx5wAw2KwfaPYkhwB8VbLwIapoX1zK4d8E/Jiyad+Z2y/l0ZnkHvyub
 fhRs9kf8ioUSIzPvnMYzCzLedhZeF2Uy3bLd+wwDTL6hixHtvaVrXbyF5+7sg839rN
 otYJSJ8zNwr2ADWh9m0cO3U2Giv029s1yJ4YxC1AeptFrGwky7zSCZGOUQRDkrPCcF
 pST/hW5Re0//vbM7mCPNx8a0ANl+AOM3pahdDLxSKGp+kt+IydYZBtjful7zeDURq8
 GLwQvDDLSvQLw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>,
 Andy Gross <agross@kernel.org>, Craig Tatlor <ctatlor97@gmail.com>,
 Matthew Hagan <mnhagan88@gmail.com>, David Heidelberg <david@ixit.cz>,
 linux-arm-msm@vger.kernel.org, Olof Johansson <olof@lixom.net>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kevin Hilman <khilman@baylibre.com>,
 Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Qualcomm dts updates for v5.15
Date: Wed, 18 Aug 2021 14:59:23 +0200
Message-ID: <162929137177.372162.12275626408150474282.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210816211957.579365-1-bjorn.andersson@linaro.org>
References: <20210816211957.579365-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_055945_272726_95A38B13 
X-CRM114-Status: UNSURE (   7.10  )
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
Message-ID: <20210818125923.DyZiMKAMX2-j9kkZU9j2hWkuO4ZVGExnqDbmMAPbdeQ@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 16 Aug 2021 16:19:57 -0500, Bjorn Andersson wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.15
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 4d314179d62b19d0b5ac8de51b491494359c7a19

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
