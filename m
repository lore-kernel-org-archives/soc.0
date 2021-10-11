Return-Path: <SRS0=0Wma=O7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A245C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 22:14:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B09460F3A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 22:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B09460F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5QzAiDSLF3akmnzpT4JnJ130He7WZ7WCo1PFyjBgijM=; b=NYmI+lXPGSM8EF
	MNzcF/zUGkpJwgS2JfcT0seRcdh6r19ZFQDfMy0AuRa0iHOqe1E633/td095mI7kk4fDGktpyQ4yH
	H2H0WHLS4WmPmX3Bq5UR4U/eDNhkJBZZk1vVVE7Mqbw6iriGLRtlJ8srn0GHLYJ04Q5VQVEKRQlw7
	vfPf/TVg5KF7FWHBmUOeQa2FvhCdI7/oncRtLz3Tcnw+0MAKvhl9nhD+xOjnAU5u9dxeFJ6MFId4S
	76QArC3l0HhLgDM381bH9Eee6whucdnqiiUKDzrW435RMihYGK6G59EtfXkQyXMLQ4B8vLOxDNRJx
	EtLXevxqtTQIY9rL7hDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma3Xb-00Ar1O-Uu; Mon, 11 Oct 2021 22:13:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma3Wp-00AqnO-28
 for linux-arm-kernel@lists.infradead.org; Mon, 11 Oct 2021 22:12:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8178460F3A;
 Mon, 11 Oct 2021 22:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633990334;
 bh=a6Q/X4VDnkKlM1ULNGlUzA/PZuWoOdFb/A/DxITZsWA=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uUXHRdAZFWfoiZAWdwfI+JTcBZwqtmZ6RoE6J/bpZwj09ZKbqUnvmdpeAOFfs3SGb
 qVF0gM3xdhnxB6I1HmRBwUKRhgkHcoW1AXIw+JQMSgoxO8q2P5Ekk02Xuic9W3UeL/
 k6pPcYzMETmOt1UzbCvJChUEfbmG8cIqEUTcGirdOwyDt7pEGdIb7OgE/rabuqnE0e
 dB8WAPjUTha/RrbDCPAzA85q3uSSY4pN8H3op676sVlMPyY5iDMEu3HshkLjWWhCrO
 xv8GHpui90H9nsQqqR6WAl11IQOTY3tllgwPZXpMLObRmO8cZoe7PdZNkdh7Ptg5LH
 4ajxu1htztl6g==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Tony Lindgren <tony@atomide.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-omap@vger.kernel.org, arm@kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 3/3] Devicetree changes for omaps for v5.16
Date: Tue, 12 Oct 2021 00:11:48 +0200
Message-ID: <163399027753.3049179.12794438950184811153.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1633950030-501948@atomide.com-3>
References: <pull-1633950030-501948@atomide.com>
 <pull-1633950030-501948@atomide.com-3>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_151215_144138_7B198BF6 
X-CRM114-Status: UNSURE (   6.91  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211011221148.csfSV1ydVffGxLHbImLOvlj69tjDTxO2pG245mqPzKM@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 11 Oct 2021 14:02:44 +0300, Tony Lindgren wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.16/dt-signed
> 
> [...]

Merged into arm/dt, thanks!

merge commit: c3bb12ba7ffe7c57d57f063aaa2d28b1341046a2

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
