Return-Path: <SRS0=ZYY7=ND=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B695C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 20:55:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C6FC60EE5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 20:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C6FC60EE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/65lyrw4ppkqOpF5ldjoXmZ1cQt3w2T+2KvFh8MZx0M=; b=oWKGmdaKyMvRRi
	IU8Ol2Ik2Z4Ln+wVrE6l7xXWrEzqViZ6wEdUy+VT5P8H+5CQIDgvcw/wXq5yDKE9pAqgD4Cy3gRJE
	UPxxF2iAFRJ4k1RyOkUQEDAeIX2zp4lP+N66fIN0h3YE/Qehl2qGC2j935bzLR3NcVUnz2q/a+TxY
	fOmJBfFW+EAo9QWrqGhgVDP4IrMhdz9dSPClASWBB8/RYqixE4GsF1vtTxyF50wgSwYtV3iBWnzJ9
	Oqk/oKtTuMFMtwu1iHio1/B6B4pV5u+FFfDtbDv4smoVcRprcwO1GdWB+soKdnTYdnEPo36LrWDnN
	DUOI8WK67qbGHVP+VsEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEHhT-00BGFT-7M; Thu, 12 Aug 2021 20:53:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEHYx-00BCgW-6O
 for linux-arm-kernel@lists.infradead.org; Thu, 12 Aug 2021 20:44:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26FCF610E9;
 Thu, 12 Aug 2021 20:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628801066;
 bh=CQfTB94Vr5Aey5uTzfsiqjmBm0NX7ybP9kXrD/fwodc=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OjpKdzBMQX6ZDApJ1yQXjKstRRSlSDwatqJr/3A8ht3pm9afLbo4Bf1IyVoqOikwL
 UdtGFx+bHhcKU4HPae/Rn8Ipfij3rdjIWj7/wreNn0dGzvzKYC1vE56bXODoJdD195
 1q7JM1ekNx5ZWppkcM/DhLNdIAEpJIFcHREWtP/peXcj30DWX9OH2UViGSrk+3Hxin
 aG7y7hsPV7XcG7QszEmoMII7rI8yxGKzIKWAB18tHaPhmJLQfALAmiMOl4+smnmXqk
 vQno5edv3KHV82Gp+if+ubppPzmx3O5L75VBlgo87B+7hyxHtmzROD8tZeegqoYt2f
 oBGTKM7o3IRtg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Tony Lindgren <tony@atomide.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org, linux-omap@vger.kernel.org
Subject: Re: [GIT PULL 2/3] Drop pm_runtime_irq_safe() for smartreflex for
 v5.15
Date: Thu, 12 Aug 2021 22:44:07 +0200
Message-ID: <162880092655.1372486.6465059399635399754.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1628751694-126144@atomide.com-2>
References: <pull-1628751694-126144@atomide.com>
 <pull-1628751694-126144@atomide.com-2>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_134427_314958_E565CEC2 
X-CRM114-Status: UNSURE (   7.08  )
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
Message-ID: <20210812204407.VK0l2qdCtEoof-ebIzgmOkW4Nde4O3ebrxkhpgL3Xsc@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 12 Aug 2021 10:03:43 +0300, Tony Lindgren wrote:
> The following changes since commit fdc07ca0724dd8ad00c22909a1464dc73ed6783e:
> 
>   Merge branch 'omap-for-v5.14/ti-sysc' into omap-for-v5.15/ti-sysc (2021-07-27 12:02:24 +0300)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.15/sr-signed
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 699fe4b190da7da239f70166288d792129acff21

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
