Return-Path: <SRS0=ZqES=PX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9900BC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Nov 2021 00:14:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EC4D6120A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Nov 2021 00:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5EC4D6120A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hwAkDNnF2uyx/2WWJekAYZyI83Sm91YtQd0Ti0zsq6o=; b=e61J9dfaurT4Nc
	E2BISOIa5hbKvtX26Kx4cx8gtWzN6aM8Z+SEm61jvU4pIkYDqAg4X2DLO6EMTuiTQfMvUgqgZBWBS
	lnv7OGaI6o5KaeVkH6USiDXHuNZl05cM3lQf1Hxq3KuBq5+w0uDK6Z+chiI7CyGYV//bqFjP3FZD9
	jDreJOaeS7c8VBnJWcAZ78NGVLE7/xvO/60I3d1YtcUW8IMTjBZsPgE+10LqAie9ZAGpvaN/Rx0M1
	/dmXLFoh0EGdY0+TrQLM0nFaaHUTVDhVad5gs8pjI/dkL3ftg4C1QnntEUYHrGfDWmzhlOaibhH5B
	A6z7YhecnUTDp9R/cWQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miQN9-0079Db-WD; Thu, 04 Nov 2021 00:12:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miQN6-0079CD-LC
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Nov 2021 00:12:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 23908611C8;
 Thu,  4 Nov 2021 00:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635984767;
 bh=R53xwiOKPYuPoGfkTMoKbKJWWekdbSb/uj3EIaw5hEo=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=AMLhYAVvAYSKEPz/cR9H+hcHpw6+L8/vpzdn5K6KYOIVM+UShTUfMfOyYpRK8QOLM
 cqMT0C3UfJgf2O1SK+S33NEKt/o33qRleut3y7Ln9vxPTzQpXhMyP/EYUpJSWKbEEI
 2AiPjePBiNxPqJT9MItKskj8/pjF1wtY2MqA1cY2TjiwKYEgoVZKA8NVpHhefeNDvW
 CzJWpUEw8Q24R9g0p+DwCnRHE3oI2IchTnU6keIpNcxJs+mHD69dSw7Q7XusURnA6L
 LFFImNUdFKIMaGU7Cb4M16YawWzG3ebm+RpudD+JS8pqg9GfMMHHwOL3gDPVmSJ/q4
 W3+fJbk1LaUcA==
Subject: Re: [GIT PULL 2/4] ARM: SoC DT updates for v5.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a3A94cW4hxjkgDu1OMH9iJYaONbktZL=yfjxVCWLLGiYw@mail.gmail.com>
References: <CAK8P3a2FokRce-oN3dRJPihmDPWuqgWfWg1FNG6WKpWiUa4eNQ@mail.gmail.com>
 <CAK8P3a3A94cW4hxjkgDu1OMH9iJYaONbktZL=yfjxVCWLLGiYw@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a3A94cW4hxjkgDu1OMH9iJYaONbktZL=yfjxVCWLLGiYw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/dt-5.16
X-PR-Tracked-Commit-Id: c17c7cc775b31ab54e8cba05f9e7b16fd32dd84f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ae45d84fc36d01dcb1007f4298871eec37907904
Message-ID: <163598476709.32364.15264904338517574638.pr-tracker-bot@kernel.org>
Date: Thu, 04 Nov 2021 00:12:47 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_171248_746054_C945A93C 
X-CRM114-Status: UNSURE (   5.10  )
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
Message-ID: <20211104001247.5ZBw0oEehCi8JWLxSPSqNsGtSwBzZ_MCGfIg31TvVCI@z>

The pull request you sent on Wed, 3 Nov 2021 23:53:43 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/dt-5.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ae45d84fc36d01dcb1007f4298871eec37907904

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
