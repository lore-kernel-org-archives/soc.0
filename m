Return-Path: <SRS0=W7ES=FN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6C5BC433FE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 20:34:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BACC22C7B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 20:34:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BACC22C7B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J6uY2Xggrdo3CWlj3wTpx3f2bFii9HNLxKXqTHd9lPc=; b=hcUFWrwKeCJRaekBXdrLexsGc
	RBOGsMQU2OxeVePkCgyE1FsDDgkRTNRec17zUljIvNvcDWObLebEO3doxiTAche8uix4qInsWCjOF
	o0CAw+aF/7cDzjAIEPgCsjconQtKBKE23zawz041J2BheWSpT0psKcbD6sRprOgEdUkLf7yc4MC+D
	HxAu7f8jJLgwJXbsgRzjnXyefSIALvNyoNZZUREKZKUFsrE6SM7AO9BphS6nV2YzSmt+FUlMoJzXw
	sGqKkIWx8AAmxZ5o86DLQJDpGT2bd8D9wRePOTWYqtodbHGBWhXp7bUK41qozrk4lZtiwCvr5rG2n
	P6X38XTfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn68p-0005Kt-1x; Wed, 09 Dec 2020 20:32:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn68H-00052x-Ty
 for linux-arm-kernel@lists.infradead.org; Wed, 09 Dec 2020 20:32:19 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	Michal Simek <monstr@monstr.eu>
Subject: Re: [GIT PULL] arm64: soc: ZynqMP changes for v5.11 v2
Date: Wed,  9 Dec 2020 21:32:09 +0100
Message-ID: <160754591574.2474728.16621718804622843197.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <71d38756-4456-29fc-26a3-341e1d09aafe@monstr.eu>
References: <71d38756-4456-29fc-26a3-341e1d09aafe@monstr.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_153218_210693_3C02A600 
X-CRM114-Status: UNSURE (   8.13  )
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
Cc: arm-soc <arm@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201209203209._T240gn3G1PXV-1qmTMlhfRBDynig_DMaXXW5rmqhks@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 9 Dec 2020 19:41:52 +0100, Michal Simek wrote:
> based on chat with Arnd I am sending v2 pull request which is based on
> v5.10-rc2 with dropping one patch which will be queue later.
> Arnd wanted to target arm/drivers branch.
> 
> Thanks,
> Michal
> 
> The following changes since commit 3cea11cd5e3b00d91caf0b4730194039b45c5891:
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 629c96256de49257b72407ebd256343938234cfa

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
