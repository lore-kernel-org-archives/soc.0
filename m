Return-Path: <SRS0=g+kj=FV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B68B1C4361B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Dec 2020 00:58:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74F10238D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Dec 2020 00:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74F10238D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vCWnpBuHL/gMmDaXW9Cutdx9rtnH3ePEuVfANk2OUik=; b=CfVssp4A7nev9R/ar8QqVOdEe7
	DwFedxFR5F/u4mxj+G7w/UHMceZnFcZKmGBoRgsXq6Bj44wsajd3Vf4JJW4Ywq7S0dCtq6YSfujrS
	NqINWoWbwTHNshlW9SkXZFCN8xRHkVmHQKZkLqCnwboZOysZcnCV4M0Zhh997LyeojcRmbpMn6JdS
	DDQIwlU+sglZqVMVVOMkQNRdx6oItdV3lCbYHju/52WcFY1Xc9g5mOpCE85UBOq7cKuNALQsIzZt8
	0UmvKmaFXeqI3ZZ6w5vbtcSyBKyUkz+YRDEtRXWfRBJ1VLWyirDc21hiOtQq+6b6cqK+k8AAikqhX
	aEaj1p0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kphbp-0002nR-3X; Thu, 17 Dec 2020 00:57:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kphba-0002kk-99
 for linux-arm-kernel@lists.infradead.org; Thu, 17 Dec 2020 00:57:20 +0000
Subject: Re: [GIT PULL 4/5] ARM: SoC drivers for 5.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608166637;
 bh=CvQcHJ71fBlQ67GW1Ar9v4d06iWQftQ90tzVLEoNLSg=;
 h=From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=PsvNd6gsg5ta2HoSboT4BAjjyPdhA8GzFwf/wOpjfWDsrlwO0/R2MRsDMlWus5ggf
 +ZPCidfZDhLXIEw/Tz8O9AhedPl+2ZeqBvvhZ4k4AcmcReJ5BGSsc3//Wx+jJGu9yb
 m79uL5ZNgbyotSxYj3IA1Ixnygzep8Gm4RviEFM6CXJN6ITGB5iVrzUB3EyWsT+c4y
 95WUowh+isMOffmta01WiQa/c2JCj0imbObTLdXabzX4ggg9ZcMrXqZ7IhMupg+smQ
 OMrHzlGdqKDrNzg/0RzlVIvmKzpr9Qx0wk5u4YVpiOURD0JTwCubyY/u2H6MjDTNaj
 7n25PZrR9Cqaw==
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a1MeLg_awR9BkRB77XhEEFQU0JKrmESbEsST6E5ZW_Ctg@mail.gmail.com>
References: <CAK8P3a009=T3WorioFWX8d=tEK78_o6ZHM6TGSmWmd37-_izug@mail.gmail.com>
 <CAK8P3a1MeLg_awR9BkRB77XhEEFQU0JKrmESbEsST6E5ZW_Ctg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a1MeLg_awR9BkRB77XhEEFQU0JKrmESbEsST6E5ZW_Ctg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 tags/arm-soc-drivers-5.11
X-PR-Tracked-Commit-Id: 1dcdee6ee8f8fdfef5932699129d442d2f1a064d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 48c1c40ab40cb087b992e7b77518c3a2926743cc
Message-ID: <160816663766.8160.10811667640759224540.pr-tracker-bot@kernel.org>
Date: Thu, 17 Dec 2020 00:57:17 +0000
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_195718_426129_6740E536 
X-CRM114-Status: UNSURE (   5.28  )
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
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201217005717.6aDWrq9tO1swRJLL8y2Q2FbZzUwLiMyKsKmPdE3CPwM@z>

The pull request you sent on Thu, 17 Dec 2020 00:27:15 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-drivers-5.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/48c1c40ab40cb087b992e7b77518c3a2926743cc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
