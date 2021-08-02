Return-Path: <SRS0=DM4H=MZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C66DC432BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Aug 2021 13:35:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CEB060F6D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Aug 2021 13:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5CEB060F6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eqNSrr6t29LjlUpAiaCBpGthCnNS4v/P9MMzEFYiFAM=; b=x0WmTalxptSQ3N
	JsByVWhP0WBCNAJpN2+JRkzoCQSj99tqVlN//DK/GvhNYR2AAuQNqxNoEH2Ben2PqMRwkSUIpe7eI
	9b8yeTI3hxaei81RPSk6C1gqiuOkchxA5IX2WjwhWI7KVaCrSvZpMYovGoClryaWlvUoPg1/jQ5an
	+y9H0qpuYb0Q8BlN5OqjcicK2uRfAOM9u9CEvyOzORbcRTRqKIGgPKUSfN+6yQsi3/OrWTAKL5BUr
	6m1EPN+BWsCVABiQqd7hPv0BowS19fqGhai96TH95TYBM+9Ri8WJoWac25qJ4LI1WwHH14D+Uz6Dp
	QVIYFM1SGO3s6ZC7JS6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAY3z-00GO5E-Oe; Mon, 02 Aug 2021 13:33:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAY3n-00GO2t-S2
 for linux-arm-kernel@lists.infradead.org; Mon, 02 Aug 2021 13:32:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9333E60FF2;
 Mon,  2 Aug 2021 13:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627911171;
 bh=ggIN/aD2j3157Mtr930iWnMMqRgd5R6xZUE1fassvjc=;
 h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
 b=owKtXUzqpVl2LnK/3+KH+w1MrePR7oR6NAzzV6QAtPaVurGmkCyYtI+9kanZPXvaJ
 0w0osYKvRAMPCZg6o2DsT9SSYvj/6vTM2xy/gw/I0hBj33mGP6B5saDDP/ok5scGEY
 XQiPe77ozu15ls5uac8uOKeBmLgVQmvXcJASo/YnbpJlOBlkQAiJ16+BwrSnkGeK50
 SerOm3yauQ4kQU5D0RWa69kgx/GnY+/FeF6FV5fgGKJcrNzfqHOwQ/i47+u3qZWSTy
 pACPwH03BToISekWLo14MIY28xUODzuXBtJC8O9IoY677qbec/D2SSj4IqEJEZaQ09
 tjal2/bkyo1Iw==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Krzysztof Halasa <khalasa@piap.pl>, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, Imre Kaloz <kaloz@openwrt.org>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ARM: ixp4xx: goramo_mlr depends on old PCI driver
Date: Mon,  2 Aug 2021 15:32:38 +0200
Message-ID: <162791113519.1139989.4454280837316167458.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721151620.2373500-1-arnd@kernel.org>
References: <20210721151620.2373500-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_063251_965102_F3D0E1AD 
X-CRM114-Status: GOOD (  10.64  )
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
Message-ID: <20210802133238.hqJ4zWXGZtFnSCVNnkPqZpmKavXS6T9EHqO9cGMQTPk@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 21 Jul 2021 17:16:04 +0200, Arnd Bergmann wrote:
> When this driver is disabled, the board file fails to build,
> so add a dependency:
> 
> arch/arm/mach-ixp4xx/goramo_mlr.c: In function 'gmlr_pci_preinit':
> arch/arm/mach-ixp4xx/goramo_mlr.c:472:9: error: implicit declaration of function 'ixp4xx_pci_preinit'; did you mean 'iop3xx_pci_preinit'? [-Werror=implicit-function-declaration]
>   472 |         ixp4xx_pci_preinit();
>       |         ^~~~~~~~~~~~~~~~~~
>       |         iop3xx_pci_preinit
> arch/arm/mach-ixp4xx/goramo_mlr.c: In function 'gmlr_pci_postinit':
> arch/arm/mach-ixp4xx/goramo_mlr.c:481:22: error: implicit declaration of function 'ixp4xx_pci_read' [-Werror=implicit-function-declaration]
>   481 |                 if (!ixp4xx_pci_read(addr, NP_CMD_CONFIGREAD, &value)) {
>       |                      ^~~~~~~~~~~~~~~
> arch/arm/mach-ixp4xx/goramo_mlr.c:231:35: error: 'IXP4XX_UART1_BASE_PHYS' undeclared here (not in a function)
>   231 |                 .start          = IXP4XX_UART1_BASE_PHYS,
>       |                                   ^~~~~~~~~~~~~~~~~~~~~~
> arch/arm/mach-ixp4xx/goramo_mlr.c: In function 'gmlr_init':
> arch/arm/mach-ixp4xx/goramo_mlr.c:376:9: error: implicit declaration of function 'ixp4xx_sys_init' [-Werror=implicit-function-declaration]
>   376 |         ixp4xx_sys_init();
>       |         ^~~~~~~~~~~~~~~

Applied to arm/fixes, thanks!

[1/1] ARM: ixp4xx: goramo_mlr depends on old PCI driver
      commit: 796a8c85b1216618258e08b463d3bef0d7123760

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
