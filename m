Return-Path: <SRS0=N7fp=HB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B74C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:30:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B50A564DDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B50A564DDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wciSQ31tyKbPSqz5CI44lRZEqMFjeNwuI8r9m86GEQA=; b=ZEGaflPpdA4jjbggrbs5XEFyK
	V7J/NFXLYDZ2TFl3KXW0peB+oA12+FpmhVrr48Y2wEUC+wOCMsD/g87h6S9pocEZYH02cZHKjtAVf
	HAHouesb0YvO16PKmjfUhageM6tNLVc1vAbnounWm5b1wsS+i4fTwK7fn8WgvJwfjtvTr1sMks5ng
	rduG8OBjunZTmW7RNd/jyKSbveeQzfIpT1zJn5o8EZ9TDimMb/shNWkFpJlVvXSc4QJ438u5U6T1B
	qj/DWjbCboXUro4a+L7OCwUugzYpeQKez/ILpe0S3SGixJRs3P+ihi6CyE9nAMNtXfkeTAee3RDaP
	53cdIFLog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5oQm-0007a1-66; Sat, 30 Jan 2021 11:28:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5oQk-0007ZC-4Y
 for linux-arm-kernel@lists.infradead.org; Sat, 30 Jan 2021 11:28:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2446D64DDB;
 Sat, 30 Jan 2021 11:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612006121;
 bh=sJ6k915t31lh60VVbOKTS3HtZV3mY7oeFzQO+vgrMjg=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jUx2xuGHzVmHQtAcYDdTNnOSQY36rNGuozeHwmBEsgO76sTauQXrvvuGC/EOVrFRq
 dP7H2A+8BQ99Qns/5C50UFjm+EM2QEcF2tHd8DK9pFNM/aBYMStwfx9gA1s1lHwEc+
 Q4DPDP6pHiwTB2z7+iI/bS+Sc9fCgC3pgVMB/YVAsfr9aHXEKbv9RgiO2KVp2LAy2A
 3eimsdxpq0zg6Uc8Robe519diohAWOZSgkKpPNviSLlewgzKteInDzIflWijoz1GN7
 KTWbTE3t44GLfzz+OPBXisfyyrmWcQpja5OFVPJP9bN8E+BrQ3LXnlEqZ/7FCYgAxj
 ZEZ1tS7xyOa9Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [GIT PULL 2/2] Renesas driver updates for v5.12
Date: Sat, 30 Jan 2021 12:28:33 +0100
Message-ID: <161200610107.2091874.1073052310080757493.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129090815.2552425-3-geert+renesas@glider.be>
References: <20210129090815.2552425-1-geert+renesas@glider.be>
 <20210129090815.2552425-3-geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_062842_269761_0326DC12 
X-CRM114-Status: UNSURE (   8.81  )
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
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210130112833.HduyS6UnbMgSHNXjlwdHpm4ds6vDcQwW2xNV45M-KaI@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 29 Jan 2021 10:08:15 +0100, Geert Uytterhoeven wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.12-tag1
> 
> [...]

Merged into arm/soc, thanks!

merge commit: e53686bbdfd2af7e63e3c0f296632c3a428c317a

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
