Return-Path: <SRS0=ZKTK=FM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6DFDC4361B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 23:15:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CFC7223DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 23:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CFC7223DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wY3qGTGgf6ECma3/ixon6in+d4U2Mn9fVWRHn+ZwKdI=; b=zNHbZE5v/E1Q8UgLCnCivTlC4
	kPT0v5vdc6mGEGDU/cimgD+NTyhELSiyGc1nG2dzIWPp1NnagCkSwvSv1r+C7sv9Fsc1YbQKfRzrR
	QKQNZCloYv67x0+2qcxw47ht6XEYiWVvwNNXkI/iuvJzcPZzVfT3Y003c7T8qeyEJtTjUlYm+GTAk
	u/zFF7bg4zeCXoT7QpJGC6cI6rk/QODDVXN/6qTGFqU7oj46shGv3SsjRhb42dN3tJ572koRQ3tFb
	tRraHmPl2Dkfh8urAT2F2ul0J0jhtjSJ+14zOIVWv9TEfiF0xmbJBxgBGno2RF4YmpTER3cf1D9pU
	CZfHMbnTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmmAx-0007Da-LU; Tue, 08 Dec 2020 23:13:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmm8T-0005lY-95
 for linux-arm-kernel@lists.infradead.org; Tue, 08 Dec 2020 23:11:10 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Santosh Shilimkar <santosh.shilimkar@oracle.com>, olof@lixom.net,
 arm@kernel.org
Subject: Re: [GIT PULL 2/2] ARM: dts: Keystone DTS update for v5.11
Date: Wed,  9 Dec 2020 00:09:53 +0100
Message-ID: <160746884670.2839681.8332418226618302281.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <1606851472-26593-1-git-send-email-santosh.shilimkar@oracle.com>
References: <1606851472-26593-1-git-send-email-santosh.shilimkar@oracle.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_181109_522803_7C29A03D 
X-CRM114-Status: UNSURE (   9.10  )
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
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208230953.JXaMU2q7I1FeJ83l5jp_zWZdt5oRBxFSNlsc3f63KMQ@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 1 Dec 2020 11:37:52 -0800, Santosh Shilimkar wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git tags/keystone_dts_for_5.11
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 30912c3ce6b1d453836d102152403b3aca5dd5f5

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
