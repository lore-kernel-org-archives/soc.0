Return-Path: <SRS0=0Wma=O7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A08C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 14:57:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF75960C4D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 14:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF75960C4D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lb+FVQ2bqnv5iUnI7dmw90xWFHDG4Si3yNyteJoH3qE=; b=06Ke0/hVfKc6u3
	Ux5Y24SOSan2YYr0iOSn8T+DhJsqYK59tDzhdrL0Ce5b50unE7otKP96Nq0k0QJu+/QHxlBB5LNZv
	79Hr67jt0Y8gACffUkaYXTVH6crH8fdJ6C2+yMO4OguOksqkcWHa/LBPfP1AWsgBlOqH/dRLYig7h
	XJRI03rwFBZIRQos+Ord3L4YvqDOGXZfi5LzDaa2S1vmOI9RxbLMGRJlk4TncJXxd7fnLYtgom2sr
	/G6lrQmFH9wxGuVeNqMcPgwwsm99CymwFYloDVbRfhgYuX1uIz7e8wrcoVKt7clstHzebQD9q1420
	5+QuOKnRy4tMpZMWRy9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZwhS-009pyN-BA; Mon, 11 Oct 2021 14:54:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZwhO-009pxQ-Ui; Mon, 11 Oct 2021 14:54:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0308160BD3;
 Mon, 11 Oct 2021 14:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633964082;
 bh=gwJSn9/WH7jBGPOAUDejmOq4MucxMh1nnl8hVskmGKg=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RLXL8JTtS9kxXS/WevrlPHbybeW2+Wj3vREClcrUCBJWTTwurdSVFo4p+j1QWcbUF
 fwg8dtLQWpv7CuRYEjHjh6vm+FxRCC+R7EInaVvaYKD9Z6g7HahhEI1gRMu9RfgqOI
 UZDppynooEe86MhXQMeuBd7B0JwEUnsqilu/qAQ60euugDk6t9Hh7/5cVU1qU5jQvp
 WZpbunu7835k3aDb2E8Jx2uLUkQuZ8DblxbpouZ//MiV9VPxE/pUYrJH8VSRViQoje
 c3l70DsVLVELapC7akV49aOZGkQJWLxjVVrvXJGq/PM/n2BAcJDea+WQE6gjhln6xH
 Ea4iSPcYY+DzQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 SoC Team <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [GIT PULL] soc: mediatek updates for v5.16
Date: Mon, 11 Oct 2021 16:54:27 +0200
Message-ID: <163396399141.3170841.8977960189531317594.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <b1d364d0-f2ae-488b-b3f7-c694049c20d3@gmail.com>
References: <b1d364d0-f2ae-488b-b3f7-c694049c20d3@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_075443_029236_DB5A8669 
X-CRM114-Status: UNSURE (   7.26  )
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
Message-ID: <20211011145427.oRD_tfux9beZxXx3oWX899rnPCVOsp0048IgHLA_5JM@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 11 Oct 2021 12:01:04 +0200, Matthias Brugger wrote:
> Please have a look on the changes for this round.
> We have support for mt8192 in the mmsys and mutex driver. Apart mmsys now
> enables it's integrated reset controller.
> 
> Thanks,
> Matthias

Merged into arm/drivers, thanks!

merge commit: 24e18b0f45c7830a74400aa599e4e3d67155ae1c

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
