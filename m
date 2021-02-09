Return-Path: <SRS0=xDNJ=HL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87897C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 15:15:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46C3064E88
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 15:15:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46C3064E88
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fdk8w6MniSINFHcie+dqGkWJiFQIdox7n0t5HRpQEC4=; b=nL/+UmQ0KPD3IQFqym3ItQZ+Y
	bEvvfcPKGQqt0xvjztcycw8DpKpiX0GsiX0B0AQo+QjX74ACTi7ILQHqEq1pv3md+zAHDLLrPUgvQ
	hSzijivzUOvtpk8R+EPpFUgcxEnoEAF2KNglV66GmJYh3h4QtSEnjXbf/ENicoYbMWzcjZRroKCSf
	zlAqoFjwVLPXJnrHZEy98WPDzrZ3FWfimdbjpjEN5sCV2wOz1Fi9mIA3K1KMkxmEpB2qsZcvIsGiP
	H3Ur2TSPJO6HJBFivPtqRbTryI18ZGmWLNjdujspj5clCRdkVVTKCvWMkP2wa0yOpCPmcj+2he5Mf
	DS7CEwhsA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9Uiz-0005Ln-HV; Tue, 09 Feb 2021 15:14:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9UiU-0005Ev-Q7
 for linux-arm-kernel@lists.infradead.org; Tue, 09 Feb 2021 15:14:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC95F64E88;
 Tue,  9 Feb 2021 15:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612883654;
 bh=Mi1fKadKADh96jHzU5Otx7r4eiDSSdbt7khqooX8Ods=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tBosjsasnBwzP1TwYqvInVxB6dZTaLDvwptlQRUX7f+sdygjoKvGN132g2kBiVL9k
 z34znZFAIWJdJjfYBt4KOYxIsY4zqLfCLPrb5JUlAcbZ2/zzz+WgsAJV/kh7SHt7vj
 F4pidT0dItc66PDdFuuPbA8IY+yU2iTppiSIDcFtHYYqODlAJh+vvJb1VPFzxV4zJq
 +XVA1vHpfkuGIegv6MsrJWVyoEEjxbnxzQ2UBXcQs1kH8psUw5xQpbODMCt3aW7DFO
 pqRHjNUE0iEJXdTKgHsT943AB9ddsB7PmkhCt5ik3/YQMt3f8I8Tpqjv4Y/x5qak4A
 SRWMVx2ILkyCw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	soc@kernel.org
Subject: Re: [GIT PULL 6/6] i.MX defconfig update for 5.12
Date: Tue,  9 Feb 2021 16:13:56 +0100
Message-ID: <161288360555.2910447.18228490031918800455.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210204120150.26186-6-shawnguo@kernel.org>
References: <20210204120150.26186-1-shawnguo@kernel.org>
 <20210204120150.26186-6-shawnguo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_101414_997732_5DF3D75F 
X-CRM114-Status: UNSURE (   8.42  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, Stefan Agner <stefan@agner.ch>,
 Li Yang <leoyang.li@nxp.com>, linux-imx@nxp.com, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210209151356.jB1NYza1ce6rw3cHfrTBtJJt9cG0g_unl7KNRBMj-dA@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 4 Feb 2021 20:01:50 +0800, Shawn Guo wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-5.12
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 39a944cd8b6463d64ca237ffb0b3b0c9f2057d21

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
