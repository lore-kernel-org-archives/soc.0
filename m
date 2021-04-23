Return-Path: <SRS0=UfjI=JU=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22AABC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Apr 2021 20:04:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1415613F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Apr 2021 20:04:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1415613F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5jRGWCkPz79CMyT3diSLKiXj6+dwP2IacvrncJPoXxA=; b=UatH1acWNML+5bK/DQMB/T1Zdx
	Z+XUUcgCd0SIM49caxndIDwb0SqprF1MVVZPuZ3V/MC+KIsAfZJfk1KfkndQZFI3ZtnOCYXM+SE1a
	SwKiWvEcuq2lpJACWZ0tNb8FUArTel4KxTH1lLzeYeUAHVNHyAOTdIcreUlbFzXUcmUkKXIthaBUH
	ApUc+zXOsZEQuLnjh7Rjk9qgDQhZwq4DMbqG3FdFyvxW/FOCDSAj+QRUK9DZBBBDxquViSGDaU3Dr
	yc28vKo29PhkLzTbL6/K45FaANX7zvO57O4smLM6bfeZBrsf0GNHSsvOonP78KKB91CH7WEG84Itb
	1171ORYg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1la211-002GDQ-21; Fri, 23 Apr 2021 20:03:03 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1la20x-002GCg-7a
 for linux-arm-kernel@desiato.infradead.org; Fri, 23 Apr 2021 20:02:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Cc:List-Id:To:Date:Message-Id:
 References:In-Reply-To:From:Subject:Sender:Reply-To:MIME-Version:Content-Type
 :Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=eMp2aWcbQt3odCo9wr4gn8XTijxNlHbNNslGqQzxu+A=; b=l89lXcjlPqpm8qElVB+5p5KUUo
 7TXQhVit3vK/X6PK4NuZHqDtAVzH+V/jkEnnJXZx+VXDV+uIj0kOE95bIfL4+H3R23KTSoI+Gmgdb
 7pzZ+bKHbJtR1ouBkrDQ11LPuzHvxTEEYMMnuoxRGIJ0lIoRO9z7yTvdcnxZEC+np7hKJ7FMiZHoE
 qGNSss4909vr7B2Gj5F67tTtWE/hnQFjA0s0Evwsw22z1JRyKlaVSVtpENLNgD2NG1APZrafpqCM7
 jbNW/1MHQ0kojdk0Ds2aJU8It18pRjEJXqXffmTZAOX2STNqOVLrs1q3LtH/IUBHyGemnOEe3csoV
 jr0XH1fw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1la20u-00Efny-JC
 for linux-arm-kernel@lists.infradead.org; Fri, 23 Apr 2021 20:02:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 7719C6144A;
 Fri, 23 Apr 2021 20:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619208175;
 bh=UDBT2Ynm3NyAVA8IxFGJy4Vy8RfkMzkwinF69rijv/Q=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=NWfQW0BqqJuv7AD5OT6PQQePULQNIaFNloBmZBzuYo1JvuZUV/T1LN6wqZXdV1/WN
 bBx5eBQjNrfaeHaVUq6eaChobfmFnV8ZbJaK6Hm/IpDjF/oS6NjEuYVq86KZoyagla
 Xx9DRwX0CHam2undKSHcMfpa5kWh7QBurQl66UFy+TKYtOid+8oHrAgyLTUu1LTiUM
 UuTsoHm38cHQQuCAfNX1SrUinOgmXQFw1g6KaTPV/mE2fgG6FnQdeVX6b5Dtrl0Lo5
 zxjLzV3gFlxbBHY4w04u+hqyv5FdaUmn8CDOxkc7jeCKb9T0cwrQQ1gxt/v1FifeWb
 +Zf4U2YwsS8Lg==
Subject: Re: [GIT PULL] ARM SoC fixes for v5.12, part 4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a20H54BCzzEtZEq2CXx57e1xeyzxf_uHq+OEMgKQvaC7g@mail.gmail.com>
References: <CAK8P3a20H54BCzzEtZEq2CXx57e1xeyzxf_uHq+OEMgKQvaC7g@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a20H54BCzzEtZEq2CXx57e1xeyzxf_uHq+OEMgKQvaC7g@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
X-PR-Tracked-Commit-Id: a1768dad775b5ceb25d17bc7a13318f43adf3069
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6d1d45cb98347dbd101b378d11b5f0deb87b345d
Message-ID: <161920817538.27381.9976776143787988171.pr-tracker-bot@kernel.org>
Date: Fri, 23 Apr 2021 20:02:55 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <mripard@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_130256_668104_F94C810E 
X-CRM114-Status: UNSURE (   3.98  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210423200255.PbsjN_BXHEXWXc6VsaCIKLSsTkp-5JK3-9v5qtI0rao@z>

The pull request you sent on Fri, 23 Apr 2021 21:55:22 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6d1d45cb98347dbd101b378d11b5f0deb87b345d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
