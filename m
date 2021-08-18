Return-Path: <SRS0=NLw9=NJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F89CC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Aug 2021 13:02:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6075E6102A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Aug 2021 13:02:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6075E6102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pulk82WoJh6sOT/H9ziarQq9+kauxdL1HLVl7/FQNNU=; b=SMwMTnkPJtpdhQ
	NrpiOdXoPiFvjuRfJz1NAx+1z4UpZL5RZVOyYRaXjHZSwOAUYxOIjj5StsdpQyqGpdejPaTzKkCkh
	FQr3tlvoXMpzphIJXi2uy/ofr4ZWtXKPC6R6q2ahgKXKdmuLNzZhEHqVJQ4KAmjZDpFD1OL92e4/O
	OjEPZxAQjR3cXHYoqLmc5fhjbLdI12AcVdC+/fP7gLlNs/ymv/soEt2/8KiiV9tWkk2g6E0dOMYwB
	t2kLP6keqBQT6XDBFGtr5qUSUZB4GbVUcbyht+XeY5QvBf5kozgLfQbWXuNHhFeFeud1wPGIySRvG
	mHxkz6NgaHe6DFPcXMhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGLBM-005bTz-Qf; Wed, 18 Aug 2021 13:00:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGLAd-005bHU-Tv
 for linux-arm-kernel@lists.infradead.org; Wed, 18 Aug 2021 12:59:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B3A976102A;
 Wed, 18 Aug 2021 12:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629291591;
 bh=Vhr4o/wfpkCSnBGcd+cyLheEmqwjWi3OvwVxuNu47/w=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=upIRv1hpsxfBLnbWKZQzqICL6ejEyjVx8GSVE96DnCxN+0vlnIupa0cootvKVLTix
 LAPcpdP8zILBvzyk9LjyxhF1EuAH7dmWqEqhuvIU9Yy7mKavR4MddsCkjmBMKTNrBC
 bxL3uhkH1xPNKdCBGOeDj80agc2tL5FBUuViICI7gudJLUqzMXl381EKF/zGOP/rev
 SdjQ+bSyXGI6++xdfu2FCy6vgBi1Ndkfi9uOpwgOcplHLDlo82tVEd2JtGSnK8k/pS
 L3xusTxumW01b7ox8KU9vcMQNInflr6YYi1j9LdwdfjtLBrq26RF2jiPJkyEBQjyX6
 cV5DEYtw4bhfg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [GIT PULL] Allwinner Device Tree Changes for 5.15
Date: Wed, 18 Aug 2021 14:59:26 +0200
Message-ID: <162929137195.372162.12135615382649684003.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <39cd7be5-a9a7-42b6-bc29-f895b9a3448a.lettre@localhost>
References: <39cd7be5-a9a7-42b6-bc29-f895b9a3448a.lettre@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_055952_029018_36C729D0 
X-CRM114-Status: UNSURE (   8.75  )
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
Message-ID: <20210818125926.H7Y0fojnscj37mh-rkAtKx4j5D4-AbmbYoTY2psiUjo@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 17 Aug 2021 10:35:04 +0200, Maxime Ripard wrote:
> It's been a fairly quiet merge window for us, but please pull the
> following changes for the next release.
> 
> Thanks!
> Maxime
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 4b2784473108ffaac1ab78a2de928931693e47fe

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
