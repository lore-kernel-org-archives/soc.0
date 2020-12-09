Return-Path: <SRS0=W7ES=FN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6608FC433FE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 23:33:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B07222C7B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 23:33:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B07222C7B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzLRr7i907VLCB0CKvkyr2kc5h0/hQjPFKVaJIShGFo=; b=2y1B1ypfMpyr792omjwdt8LbsT
	tx9q16ISHqMbnjlZWqUZeCrxuEMS8Y/LX/ZBEIaq7CCZzt3ilScE0eGxR8mQSX9/mxCVqcrLzxYKh
	Zd+wFBlXYQIujPcx7QqxdSPsfIBxDh/suFlZE/yDNpUErDz0HLM4GrJqwPO8so7ou53w8hqv51+uk
	URyZ2mRNGt2cbgdSvs9/JkB6zpAzPznJB64kZ+qeIcyMs3qJZ23iWsLi/tC9Em7CxOa1kYSzw4scu
	Q3ifX5GsMbCalVmtJXz03JuboonkccpSIylk+JvA03bRjutSWB4nf3/UkDhLEJ6Zr4RsvwoqeqR38
	uZbivrqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn8LK-0005pl-2F; Wed, 09 Dec 2020 22:53:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn8LH-0005pA-HO
 for linux-arm-kernel@lists.infradead.org; Wed, 09 Dec 2020 22:53:52 +0000
Subject: Re: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607554429;
 bh=v0W/536EuIwh5aALHFkG9IPXvhDkuTFU0QwHlbagWqE=;
 h=From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=StcjxCCb+HMfclTfuWrBEOxq0vk0XU+3trq453jLfzyozQNtqohZlQpLnRH4IXcjZ
 NQrHiNRDcDqo+hGI2t4c4Bt12RWnukBBeZr30Ent4u4+qGuxM5kednskL3FsxhhqAC
 gCUKfT0QPWy+QAh0QXJXmQIgBa1NOothE5jIEVIk4W5GgZXVxI8CDX6B5plYBfE0tY
 uzJ1fUZdtUTB9+66/KmGRHq+dS3XvNLc0o46EtzUGih8HOoLWVwQQCwJD3RZXBUXwk
 KK4Ig/yWx+ieRooaouTqB9FH6TQMDdAQEpcyUKUqKM6zElX6olhtoAJ/3zoxHWLNzc
 K8qnC9wcpH+qw==
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a2piZwSjDudPu8mOEBnRHFAXRBMcRZsqS8b6YD3Kjwsow@mail.gmail.com>
References: <CAK8P3a04h2KA6s-m_O2MJ098frTSmxvAg-ngrdP4d9=9YLXmyw@mail.gmail.com>
 <CAK8P3a2piZwSjDudPu8mOEBnRHFAXRBMcRZsqS8b6YD3Kjwsow@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a2piZwSjDudPu8mOEBnRHFAXRBMcRZsqS8b6YD3Kjwsow@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 tags/arm-soc-fixes-v5.10-4b
X-PR-Tracked-Commit-Id: 69fe24d1d80feac4289778582cf0a15256d59baf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a2f5ea9e314ba6778f885c805c921e9362ec0420
Message-ID: <160755442971.8086.12518743666156254013.pr-tracker-bot@kernel.org>
Date: Wed, 09 Dec 2020 22:53:49 +0000
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_175351_665904_5106D6E2 
X-CRM114-Status: UNSURE (   5.38  )
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, SoC Team <soc@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201209225349.MUrvsCjm4_ptR_pwlvjvGQUuD9TwfRe1hhjXspa48Pg@z>

The pull request you sent on Wed, 9 Dec 2020 23:07:10 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-fixes-v5.10-4b

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a2f5ea9e314ba6778f885c805c921e9362ec0420

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
