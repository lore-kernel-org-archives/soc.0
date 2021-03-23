Return-Path: <SRS0=aJU7=IV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5601C433C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Mar 2021 17:34:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40552619C3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Mar 2021 17:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40552619C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NvGV/jfwDH/YAlF/oTx/+3ZUoXqjxB9fIRPXj46xnWs=; b=cIeTLxe2VpwSVvaxy5aQXIvpR
	SSF+9qwEJTFqOdRNV7uRruJzov1UtASHfzqwqiSsYhb6PzVQXQb8ipf7xeUOZLMhauU6nnU0SqVMe
	+FyymCWmYv5TlDONeNt7LNAarn50rxI9XyUgrfmYX2yjqh37eTLBXXItarkzxixK2qXXlBDovRS6v
	JmXalfyxj/KrcPUmupZtuKUwgHg8rjLJEEsZRMk2V7wgfH9RXNwMXJMimM9AL1n8McXaxWa4Cbq1n
	fW9Tztx/IqPPXkyI0v7xXPcDHZrtCq3DYRHDol/W3+u/OfIENO6De89oG7ulEWwcjENui5GXyKem1
	8ThlcR1vA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOkth-00FPNP-VG; Tue, 23 Mar 2021 17:32:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOktd-00FPMd-QC
 for linux-arm-kernel@lists.infradead.org; Tue, 23 Mar 2021 17:32:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 54005619C3;
 Tue, 23 Mar 2021 17:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616520765;
 bh=S4vPaEqsQgKupS7zDXxnfmBA92ObOfW26dwSwwld5/k=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E07ANzxZSDrDPHdP9YLe3BzrK5kxdHjFf04pi7w1dzJceB7+N8kEU0lJWMc4IW00n
 Hg0QtGVLX42JYJhU1wLmGXbY/3GovKPHSKmSnbSxnNHTW1k3CPOEpy8Z8OiG+uAn/k
 kl9/gDDOfexkO6xsGx7LuoCxFXCwu0GHHoM43ZLwJaSgv///h5X2cy/eOhVHhqlZjR
 IcbJl/BUs3GGH4ag80gHbSBttMpe4Nxr9d+0ll/nunC+VWAHgN8HHA0c/RDziaT865
 /WqMCAVud68QM0ibCVShmUtI0LrCKSiZfwR5chPWcLcEdgSTjueAgJMhIui0PMW/Gf
 +bL+10iksCHkQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>, arm-soc <arm@kernel.org>,
 arm-soc <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-renesas-soc@vger.kernel.org,
 Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 3/3] Renesas driver updates for v5.13
Date: Tue, 23 Mar 2021 18:32:40 +0100
Message-ID: <161652074444.2900645.5656871088682377638.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210319085146.2709844-4-geert+renesas@glider.be>
References: <20210319085146.2709844-1-geert+renesas@glider.be>
 <20210319085146.2709844-4-geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_173250_079126_FF219CFF 
X-CRM114-Status: UNSURE (   6.68  )
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
Message-ID: <20210323173240.VZe5WkcDIE54r2T5f06iUAimpX2hSq3BCBhacr7iosQ@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 19 Mar 2021 09:51:46 +0100, Geert Uytterhoeven wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.13-tag1
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 10f765d68ba218fc0125b0193a058c82cc3b481d

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
