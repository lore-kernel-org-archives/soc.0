Return-Path: <SRS0=E8YZ=HE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14219C433E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 21:54:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1E5064E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 21:54:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1E5064E4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7uVW1r8IXbppUgWtzFY0BwP9kIVXGy6TVyZUFBgx9I4=; b=n65y5acGohmc68moUKOKxKKFE
	x/xiwgnE8Pdh1GbQoxu15a4b9VunhhkeTmaNqptibMsbL38raDsvEQZrQYNX4iLBP0APYbtfTNSix
	HhRzaoQ9B1Ip6qaQOkVgxuHhnO9Co5YSBlYgZKnjZt8xjbmkAUPXWpq9YW68CSzWYhoLhjbg8KIX8
	EplLU4Hff3DGjOWZv5f5u5uH84QrD4dqhSmxsqfFY4CtBdXSOn2TQayBUV7NCwsiWrwzumyUO6qx6
	tfnSUVo9yjknj6+dNTftfGGDjHaxh/2NtoxJjh3bmalFyb69T2eWsm7cXHkSWYQ/a85I9XMrYwGks
	zfnvJ2wyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l73bw-0005ab-Jn; Tue, 02 Feb 2021 21:53:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l73bt-0005a9-Nx
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Feb 2021 21:53:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B969B60295;
 Tue,  2 Feb 2021 21:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612302801;
 bh=EoJMCPPOCFYvxsYI94SQA2tHauStkh1tzsAADB4oiTY=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mlsexEU9b047AquNn4VFEE2gzcDTp3sSHMlrWBRZibYJp8J8Ma0/r34lAOefIZId7
 /UBGScTZeYzacaZ1zUKLQ4vFm5i5jkmLt6PoIzOPi2v8e47IHC+7nP8wH0Cush3Ijx
 iUQ84lSmVrVKmRrUWGEATI5/9GVinNqn7fVVAiVXyxDXbE/8UTCMFz/uOMdonGwGp1
 KiQSZ1uPlKEmGffmUmWJvZhqXKCuehREl4XdaaaAcq98MgyV0hfEMVtlfEeKPtFBkN
 iw4MDk45cPOQy2/5EsjFoYnwW1zj/QlW/chLFmCQ7/JV3x5qDaANVEh24inG829ISc
 Tk846lPqzYx6Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Santosh Shilimkar <santosh.shilimkar@oracle.com>, soc@kernel.org,
 olof@lixom.net
Subject: Re: [GIT PULL 1/2] drivers: soc: Keystone update for v5.12
Date: Tue,  2 Feb 2021 22:53:09 +0100
Message-ID: <161230250379.1905703.9570631135024676951.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <1612156854-10929-1-git-send-email-santosh.shilimkar@oracle.com>
References: <1612156854-10929-1-git-send-email-santosh.shilimkar@oracle.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_165321_857532_9007A806 
X-CRM114-Status: UNSURE (   9.01  )
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
Message-ID: <20210202215309.vMbdVmN4wQonJibn6LHSXx2Q0ZGzabtE6PHn9bkGyFw@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 31 Jan 2021 21:20:54 -0800, Santosh Shilimkar wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git tags/drivers_soc_for_5.12
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: b04c38b666edd9cf19ac773a7a899cf8554a474f

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
