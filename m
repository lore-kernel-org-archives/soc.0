Return-Path: <SRS0=j33G=HL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE168C433DB
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Feb 2021 23:07:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DCFC64E50
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Feb 2021 23:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DCFC64E50
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PVaso6EtVXf3JDtiWkE10+Qw+NKyZ10riNVD+RUORLw=; b=u4AtxZNBNL5QPQO4/58mqm1wT
	wzpRZUi8GbI07QGdqDcEVjmvz31WZx2hQeChLc37XTQgqNtmoMdrpaMnsLldrPGqDaaU6MrDmEdFt
	LFrq3OXrhZvtcXRLz5fY7Z5/aleeeINo6PfrhyM7Oosi3JsjVAar/9tsEGqJGjZn4cKsOiaWiqRB2
	1CjLCBpx5PUacF2sia8XvOYtNjsHWVDeHfjPfydOQlhsdpOv8Wky4wSZJMJuy9NI1Gp5E8DUzbhpr
	6Fca92j1Orkh2TWdtRp+HmLvPYFh6TVPJ8Om5HMjTf796eNm7mOFg2ueSy+EPN6MHn50Pf9fFBF8+
	gtNgVDzHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9c6C-0007Rm-Tb; Tue, 09 Feb 2021 23:07:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9c5c-0007Fg-41; Tue, 09 Feb 2021 23:06:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2265364E57;
 Tue,  9 Feb 2021 23:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612911995;
 bh=9YckVoh99k0PrrQq2KqKYIvjQiEOYXO6rHCjaSjFj6I=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EVKLJe1yPw1/n6LwmzInl36ikv4ezSItsNi6ALzvt0E8jNGpoAtzcbgM2hHtFlGYG
 0Bc1/nJWUDonqun1OCN9YTnF5Ey0qdA+5vmL/sOrHKlOxfSlagwSsulbMkqwuvHAxr
 Gffo8InVG/TAGrYm363sPQD33bflMGT3F+uaFvonuFMuJZFwtfA0gPYgjr1V7z5Ckb
 zvtUR/K9YW9FBCZOKH109bxdK1+aVMzdsgYueZTvK1scEam0ZQ3+7cxuCrIAO5Yxbr
 nsWAVk4GQElEeW0IIPVuLT7wTqJGBAwHuj1U10/q7FQDf3Ee+KXffnXn2eWiw02jUo
 DtOcvIZh0feDA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Kevin Hilman <khilman@baylibre.com>,
	arm@kernel.org,
	soc@kernel.org
Subject: Re: [GIT PULL] ARM: dts: amlogic updates for v5.12
Date: Wed, 10 Feb 2021 00:06:08 +0100
Message-ID: <161291108049.974605.5648830104662503715.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <7ho8h12bto.fsf@baylibre.com>
References: <7ho8h12bto.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_180636_284047_DFCD0B70 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Message-ID: <20210209230608.PUqA_s9n726RtKOYEkx832nnwKyumknDEGja9sXnzTg@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 03 Feb 2021 11:25:23 -0800, Kevin Hilman wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 02bb4cb4c463bcf656d1d2c20ee8a41ff5a09da8

       Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
