Return-Path: <SRS0=LXKC=NR=lists.infradead.org=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DED2C432BE
	for <linux-rockchip@archiver.kernel.org>; Thu, 26 Aug 2021 09:35:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8784610C8
	for <linux-rockchip@archiver.kernel.org>; Thu, 26 Aug 2021 09:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8784610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hFgNzfQn1nc4okT1lu+V8pVuLn1XTl9Ou71SdzPxQAg=; b=udWuYECVczGZ23
	vwQYPPDg2/5r4M3eZ7EAluRX2QdLQ0741IK3FVn0fVamW1OglQOhZFISiDJ+0p80fPYNPdufyk/Qw
	M0QXfrekUcvN2Iih+h2+DaEkHBMEQfC6bTikvSINv9z3uxr8+DSHTnMrGN7mMKSRvlqwTEsfs5yJn
	PbiTAt+lWpzOlcCL+nmdQHQoBT23zqYSs7AcgVa/lvHNM6MrxjS6fCpaJbx1Lihhf56hYEtMkcB6t
	p3J3xL8bWgy/Ixj9CoUi08t7EonQ5iwEdABbBwRqbYgnnH4YtXr28uvbGRYQjehNjZuFlsksedXVy
	7pHqYHc1WKYXjGdTQR0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJBnJ-009gES-Qg; Thu, 26 Aug 2021 09:35:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJBmu-009gD2-PL; Thu, 26 Aug 2021 09:35:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AFC52604DC;
 Thu, 26 Aug 2021 09:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629970508;
 bh=ly4yxmgq1lF0OXbu3ixVqYdKtrdpDwk+tGQ+swQjkh0=;
 h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
 b=VaiHTHU2hb/9LvMxCCppfB2JCzlSshpZ28BB6G2c/cFdnDGo5r6OoYtH7l09oN1i3
 2DsjHWd7K+f5H61S4g8QBdmF9j23vRV7HZGisDHW0WDwRvv24l3HICtSDf+LRIXvOJ
 YGVeklf3PoquKuF6ZPr6vKgYyt3g3j+e1k0822EYEnSNxSvr6G7+IxJoe91odkPGDS
 EuvH1/kvHxaUyNskatl+7/6/QPIm2zpeXiOrtd2/bhRBq1L6vCcHHxyIUzamLa6TUC
 f3eY3xrd/KGCOcVqGv+1cG4U+2mrhhwpbdzMhSDhV6YK/rtZkAqlmO+W4cMD18C0A1
 W7JMbcDqBZSEA==
From: Arnd Bergmann <arnd@kernel.org>
To: arm@kernel.org,
	Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip driver changes for 5.15
Date: Thu, 26 Aug 2021 11:35:03 +0200
Message-ID: <162997049860.837527.581297114646598072.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <9718620.EvYhyI6sBW@phil>
References: <9718620.EvYhyI6sBW@phil>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_023508_885143_F6885354 
X-CRM114-Status: UNSURE (   7.19  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-rockchip@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Upstream kernel work for Rockchip platforms
 <linux-rockchip.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>, 
 <mailto:linux-rockchip-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip@lists.infradead.org>
List-Help: <mailto:linux-rockchip-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>, 
 <mailto:linux-rockchip-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-rockchip" <linux-rockchip-bounces@lists.infradead.org>
Errors-To: linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
Message-ID: <20210826093503.qLuSc26Q1K1_7ef0X7ddaUnyWwsRJ4X0FabyGpEZjoQ@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 22 Aug 2021 12:15:43 +0200, Heiko Stuebner wrote:
> please find below (and in the next mails) changes for
> Rockchip platforms for 5.15.
> 
> Please pull
> 
> Thanks
> Heiko
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 9b3878a99ad606fe76a50a290273d7b801f0f895

       Arnd

_______________________________________________
Linux-rockchip mailing list
Linux-rockchip@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip
