Return-Path: <SRS0=ZKTK=FM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BEC5C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 23:33:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B896023AA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 23:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B896023AA8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=T0PnAppCGEyKcJZWDD405Qa8klx8ioF+BZ3BtV+NuTY=; b=wRWqxNCwSmrF4dj8onu++SOIn
	xaJN/zyQeQcCnFNHplUVOEy0ls5P5XlEbdPA6XieryyXClAif6HmuY6wuZuTGTTShcs4iJHuYDcIL
	a2APfYd7WxNo0wADr62B6Z0sHDUyehrNzD+KJetNrYIiaQUbMcDMZ3YoSZyiNBmfQwrocroNKi1y3
	/c1v7lyWvrZyCt10gCEDEgwabWi8zztLbxBlOnTC8XeBvhFOGeWjhA/ciWSI9pE/z81ihBRBs3zOi
	A8rCdu99ZiztgCjKPXqzrBlaK8mdKCVs0HO142GJFDIziLyKSvZ0/lrKee9QV2WDx6TB1ER7xFqpf
	fcAX6bXbw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmmTO-0002sa-WF; Tue, 08 Dec 2020 23:32:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmmTD-0002os-VB
 for linux-arm-kernel@lists.infradead.org; Tue, 08 Dec 2020 23:32:37 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, olof@lixom.net,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>
Subject: Re: [GIT PULL 1/2] drivers: soc: TI SOC changes for 5.11
Date: Wed,  9 Dec 2020 00:31:42 +0100
Message-ID: <160747024170.3766805.13695158054024350969.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <1606851405-26338-1-git-send-email-santosh.shilimkar@oracle.com>
References: <1606851405-26338-1-git-send-email-santosh.shilimkar@oracle.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_183236_173626_705ABAF1 
X-CRM114-Status: UNSURE (   8.60  )
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
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208233142.lqvZax3VNxQgpicEKbbGcZssQtXxlPaOpWzENdf4GkM@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 1 Dec 2020 11:36:45 -0800, Santosh Shilimkar wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git tags/drivers_soc_for_5.11
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 92bdbe647abdec49862ac1439c1a286f48218376

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
