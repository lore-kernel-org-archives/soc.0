Return-Path: <SRS0=0Qs2=M3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 395B1C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Aug 2021 14:08:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B6EB60F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Aug 2021 14:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B6EB60F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B8TYSs7D2D0OujRhwDkKEvZb/uHRn0vl9Q9IULfPDO8=; b=c1hpV+8YKTV6cs
	jgQF7oIGjDv1dNvGkWPrkm2piZRXmqf7TRDTk2WjiHUl8I9OZBi6YBSjB9vGep2LkKEflW0xFIbAP
	LA/OP2xThyxKcQiNdxA6EwNEG5Ofi4Cw515+FUhzJ7P1S9bsTjv4R8F94c450d9OKogoqIBSJjRAg
	ObADkZJkk97K5izZ4xBtUDvRgNc71XyIiiCHisdRHO+dYu4N3kh8BEai6APvQO4CS/MVgJ9alVbvR
	78YPkeJQ8GwuLn+pea9Fr56PPuANXfaJObtWYkvGwVjnWy+nRnUgeE64YHcs3Uco3coOtx91YtR+w
	/qCD18aPAUxWd5AK0d1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBHX9-006ISM-Vd; Wed, 04 Aug 2021 14:06:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBHX4-006IQR-07
 for linux-arm-kernel@lists.infradead.org; Wed, 04 Aug 2021 14:06:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B1D5F60E52;
 Wed,  4 Aug 2021 14:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628085965;
 bh=HvEWF7JuyNJklmFh71f36kZl3uxBU3pofSwou0L+lf8=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CwzVRssEoPw3PuBwDWuNUH7AMEhGTOrVbvkA0islivPcQ5Mvb/ke6k3HAxkaL1VFQ
 imJamjgO+MXbP8ZrOG1fSXFxcp/NDKAMPTW8CvdPGtWevOaByz/ykFhnSZ66ZVJ01e
 RA4RyMayKjhV5Y4WL2u4Ts8pY6KqGt3LAeXduIyI+7yRYkDCY4wrxLrB1BFQjiI9NH
 LzLgWL8AuGFjLYC5D+GTVgcjtYA+gX5BilN4RN6xulFFmP/qGpo/V2kha4yCXD9qyo
 l5Jl+/misjxxYLj3V3wkc9op6GG4u0Jr8riDvOIff+eshR+UATdd9FUqVfM+rCor0O
 jysFGtVKgW1oA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, arm@kernel.org,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linux Kernel list <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: [GIT PULL v2] ARM: at91: soc for 5.15
Date: Wed,  4 Aug 2021 16:06:01 +0200
Message-ID: <162808595100.690655.10542947732336817960.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804084316.12641-1-nicolas.ferre@microchip.com>
References: <20210804081721.11093-1-nicolas.ferre@microchip.com>
 <20210804084316.12641-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_070606_127914_539F82A6 
X-CRM114-Status: GOOD (  10.28  )
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
Message-ID: <20210804140601.l12aKiS-vqhgjIVS0qRcZVciuLE6O6adP-et6taU3Lc@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 4 Aug 2021 10:43:16 +0200, nicolas.ferre@microchip.com wrote:
> Arnd, Olof,
> 
> Here are the soc changes for 5.15 which contains the introduction of our new
> SoC family: the SAMA7G5.
> Note that one header file is shared with the clock sub-system. We synchronized
> with Stephen to make it appear in this Pull-Request.
> 
> - v1 -> v2: text of the signed tag aligned with kernel revision targeted.
> 
> [...]

Merged into for-next, thanks!

merge commit: 318845985fa032a865784ef5373f182fcdf037a9

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
