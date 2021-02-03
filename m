Return-Path: <SRS0=Uajl=HF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A282DC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Feb 2021 12:33:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C30164F9B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Feb 2021 12:33:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C30164F9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aI1L5ZKe3qBS2O0STVbeNZuIROyPEojPMbOf3J2bjCY=; b=G+zCQ6ah4UhAkby6l454dyqvV
	rFLLIDCguY7vm2ThKWWsEY9Ga/vLQdaoKoDLw5RCiwpQzGEK4hOkHl3LivvT5L5KNjqXTl4EMk07E
	WOn9i1nem9NW3LWLG27YtsOSI8KvGI7Thmr5HWhF3Y/9C/9/v0+O2yg5h0XD8nje7VBuyOLLFE2uZ
	V5lRGn6HNLl0HT3XTbyLZ24uR0Ql3zLZGDOEnq1+ZWtCN5v1q4+AYnQ/QUHKKrn7T5pd+iN69ifKE
	C5dB0nQIw/mNkotj6FkzKo2DvqaetD1wr1rT3BJlYdydY/s3/c5wbuiTaLRIH54gPtGtzfyt1Cjc5
	0vxSgz1fw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7HK1-0001tu-Ud; Wed, 03 Feb 2021 12:31:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7HJy-0001t1-MX
 for linux-arm-kernel@lists.infradead.org; Wed, 03 Feb 2021 12:31:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8086964F9F;
 Wed,  3 Feb 2021 12:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612355506;
 bh=6ADiZNTlHAF2RHz64S8FjGDXiXXKIWA5HGc+MA1Ir0U=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f5hy/zH2mwbHm8MZiKBc8KjNyfBJ1BXkfogsEImnRyVjJbiJl3RXe2wPAHglpDzJJ
 gHuUy4dJTrJWwMbZenSHEei0Eb5PzXpzWjgcGxd8E6uE1rDTyz1I0VYLuYNWGuEAfL
 M3d16YB/sYCr3vaPsBfBUZ4n5Ds8QieWy7BgFoXC87/7O0KRq2kv/G+ED2gx0E16Lc
 L/Q6G0cZDiXXtkus0Vi9wWcwi0FCITpxk+tDTXHo/BVkF91iIe1j2X49Q3Kq6LnUm4
 yBAsoSxXDAT1DQXyt0f3dN5fo484ZJ0uSlGdipBjKY1mITTp6kRJ5qp6KrVr+xbZPT
 gvUFHF7g0IwNA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [GIT PULL] Allwinner Fixes for 5.11, Take 2
Date: Wed,  3 Feb 2021 13:31:35 +0100
Message-ID: <161235548539.2002750.2693038279702469216.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <f8298059-f9ca-43b4-9e29-35bc0e0c9b15.lettre@localhost>
References: <f8298059-f9ca-43b4-9e29-35bc0e0c9b15.lettre@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_073146_836935_456D0BA3 
X-CRM114-Status: UNSURE (   8.86  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210203123135.96LeJPf7ZQ75RShUWGjloEa1qqrlAq3eOfg2h3T3VkA@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 3 Feb 2021 11:12:11 +0100, Maxime Ripard wrote:
> Please pull the following changes for the current release. It supersedes
> the one you reverted that was missing my Sob.
> 
> Thanks!
> Maxime
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 459630a3ebb4110c571f103fbc2d8120be001e39

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
