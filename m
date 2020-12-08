Return-Path: <SRS0=ZKTK=FM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB8EC4361B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 23:12:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D754123B16
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 23:12:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D754123B16
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wkIygdJ1KGtFTR+gbXUyC4/wfW70MGl+W7ExhG6Qp34=; b=cHKqPf3GXsg3os3Ql8ub2sgqS
	hku++1kPpNa010Thdi01z3dN3fIFIQOzlXvfK7kONkMHDs0XlPEtkuuqiLi1TMEKj+oib/8VLEVtS
	ENZCMIyQMMZW3BOzdRMRuj0XtXuxHJVSUeR1Yt1WL4+Apk4KwFl/Ej75+DMI+fpCzZeKse7i/+4M8
	ooVviwsy/b1VL5SoK1iSqHCkiqprLKByhQvPeW3wfqRsZlEZHwp0cKqmdJsBNkXNV69HBZi6/napg
	Ah62OI4hucmnS0pBD9S9u1D0fLR0zPokmiQdG1yHEllVguM6fmdjNeeFqEuwouvsiQ3U4j5UH8Pw3
	frlRQricw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmm7x-0005ZL-Lf; Tue, 08 Dec 2020 23:10:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmm7t-0005YZ-NM
 for linux-arm-kernel@lists.infradead.org; Tue, 08 Dec 2020 23:10:34 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>,
 Olof Johansson <olof@lixom.net>, arm@kernel.org
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v5.11 (#1)
Date: Wed,  9 Dec 2020 00:09:40 +0100
Message-ID: <160746884569.2839681.4641297073633961685.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <87eekaj0i4.fsf@BL-laptop>
References: <87eekaj0i4.fsf@BL-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_181033_854464_353CDCB6 
X-CRM114-Status: GOOD (  10.80  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208230940.YxPN25MeL5H--RWtyN13M-DQ09xWk4DtkIjFM9bBSlU@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 30 Nov 2020 17:02:59 +0100, Gregory CLEMENT wrote:
> Here is the first pull request for dt64 for mvebu for v5.11.
> 
> It is based on v5.10-rc2 because some fixes on the device tree has been
> merged after v5.10-rc1.
> 
> Gregory
> 
> The following changes since commit 3cea11cd5e3b00d91caf0b4730194039b45c5891:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: a2f9886a9ea55c3ea973048eb5cf3d972dfecb90

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
