Return-Path: <SRS0=aJU7=IV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE72C433C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Mar 2021 17:35:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C89D619C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Mar 2021 17:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C89D619C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SefZTdrjBqD3GDWLTT1DxrYVN0R6Nh7KGDkFSbg/A58=; b=dfpaHoI4ocBZAAVCR1r2GOhJm
	RnU4xcHqzQoupWw+6QhcWl5YVWdAA8X1X4cQfE7cVFdgK6ycbmOq+KxbA+hOvx0VWLvmFuCfhz4rV
	lN/VO4Sd/IKqewZzkI+IWzx7KuFI11cSiLdq2+4D0GuDL52zVHad7N3WfwOJO462uMGT+gf2Y1Goc
	WcVnE4P8ZZ7/6f8qH63WEQKCdExUThLCSGBFRBPCDHrC8pN3r3CU78ymkJGpHJFXn7/TayPcK3NuI
	tHVA0BrCrPjBojr8htdi4ieTya7LbnApVZ5FqcZJvdv/fNzpEIkIxhHtT2hMzNVJ20jTUC4bSC1tl
	qtbGdgygQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOkuz-00FPgt-OT; Tue, 23 Mar 2021 17:34:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOkus-00FPeV-L8
 for linux-arm-kernel@lists.infradead.org; Tue, 23 Mar 2021 17:34:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D9819600EF;
 Tue, 23 Mar 2021 17:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616520845;
 bh=1P2fQ8kHbnS7O3gDUlqincn6nGWEB+xXUEVX945aEIU=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jAimD95ph7ls+ighEMoEQS9Jm0jmch3nixsi14V1vhpdP5nKjdddwUfMvA10A24q1
 pD9ZS5Bw2dCFS/gcIFBZfLg153UqAKzpi74GXsq4S6PR7J9JVVv6DqqN5gZU4oPhqa
 pFOX216LaXVAOVB1hAytQ38FSoWd94fR8vywYfFvALxES9haqa4D3TIb3r2MTum63G
 EDAdSw8dSRYUqFkY23/Pmn62BBnxOiT5xRLWHE/uaAAwEvQAh/3+zeqouCG4Wk/pqb
 x+ebdK7aGKzyWZEw2ozQ0J5se+GqwYLLv/xEHy2mUHT+Qdw8jW5uTP/tcr7Q4hQ5Tc
 qLlg9gu9UXAKA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <soc@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL 2/3] Renesas ARM DT updates for v5.13
Date: Tue, 23 Mar 2021 18:34:00 +0100
Message-ID: <161652082999.2901149.1420849682427390367.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210319085146.2709844-3-geert+renesas@glider.be>
References: <20210319085146.2709844-1-geert+renesas@glider.be>
 <20210319085146.2709844-3-geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_173406_882436_2F6FE5EE 
X-CRM114-Status: UNSURE (   6.48  )
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
Message-ID: <20210323173400.hHAHrIFJtcEtV37gZdCyK7stAkZU2nWfNCWpxKMMO1o@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 19 Mar 2021 09:51:45 +0100, Geert Uytterhoeven wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.13-tag1
> 
> [...]

Merged into arm/dt, thanks!

merge commit: f38dc82b56a83be8a18e395ff5568e46621db749

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
