Return-Path: <SRS0=xDNJ=HL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69579C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 23:14:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A9E364E66
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 23:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A9E364E66
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/6v//yi1rVy+H5uqkdmtjbA4cr/RQhSfw+uHJDho6H4=; b=NZUatmYKgtWC1ZvZbUqf3P0wH
	GjA2P6970sZMhp++qjNEv8DP3VhzlWnkN/9BLifoZHoqRoxw8gXhJrL1CFVQea8/OkKSzwn/3jWiW
	ZwcXxe5+DsydyUIQCsgFBxH+18vF3pJEy3HFLotKY9QDywGkyxZXHXAXz12NMM7XElbHPnklrd5I/
	xtu8kVn5PVONSpt+Sw+cyq0EEE30qSuM2pzoxuuG4oiEze56p1K5w6Q6XWuNTuntrAgOxbnZrPN8E
	5xW7NmoctRdlJhNCHymPbIzIbVEgyP6bYH2XZyyBAkKg7/EhQd7vQGcVap1k8KBjcKKp7nb0m1WwD
	PkdQINiIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9cCN-0001fO-AY; Tue, 09 Feb 2021 23:13:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9cCE-0001dh-Rk
 for linux-arm-kernel@lists.infradead.org; Tue, 09 Feb 2021 23:13:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB1E864E58;
 Tue,  9 Feb 2021 23:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612912406;
 bh=/ZdFo17bf6cB7ILhJGSUVyxXy6CWWcTEIOoF4R2L8wI=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LW83VrPUK9X4MKRYm5yuQkOWtp1t9Pcvx7ZaXVW2HsHXKY7lmqQT9BGU9wjAh4gKe
 ZbiIu0Ypm0G2XK8hVKGmmIqp1wOwAM9PmJOZtb7G112ET1DwDaeRACqt4CkW9jOA9j
 ai2Z3Qdd3TDuiLOFTrhKbVDwTFgrCQQ7F7otd6bywPVGfQnPv4iIloyWReWDXOF90I
 bUU0QCe0K20QLN7R0UezgMzJMvo1bNvwx7waT/ybkoI1pTRsFh2dmbmzcQEmU167wO
 pGvwaWEyA3gI3FHae7rjezFvQ9b21iC75yJnDD+UIXuN2FKsn4Shzjw8w65tsiti6I
 gBqOD0KHwmqiw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Tony Lindgren <tony@atomide.com>
Subject: Re: [GIT PULL] Defconfig changes for omaps for v5.12
Date: Wed, 10 Feb 2021 00:13:18 +0100
Message-ID: <161291238380.977540.4016262354354191841.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1612421637-483551@atomide.com>
References: <pull-1612421637-483551@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_181327_051641_993B8FA2 
X-CRM114-Status: UNSURE (   9.04  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 arm@kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210209231318.1K0QGrQ67OBHlBmGh7gN8BNivKfBlaNq1sv2Ia9lGN0@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 4 Feb 2021 08:54:15 +0200, Tony Lindgren wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.12/defconfig-signed
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: c76fe896d6fd55654a6d0235e220e01a0c70bfb2

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
