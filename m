Return-Path: <SRS0=45Hb=E5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80910C2D0E4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2020 16:54:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C6A9206CA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2020 16:54:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iOvpeOOQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qo8/Wunn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C6A9206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MLRQqaQ4Y6sI9Rvi0kDUfMoxyEIUpEtTU99jl1VJipY=; b=iOvpeOOQHnAuNdIlU+GVOVTaI
	HjBqNreu2+d5e/L6lM2s7fQ4v0ppVNE54hsxJtn7Lf/A4P6yToXD7WClQCeMyy4gSiIpzmcCFHfgc
	cVLjfN41XtqUHIjPdSB6tUxpOeewQxy+Ii39vm0O0o/01And2Q5H7DLMpIiLjPjWZejwe+AJ7+3Tl
	blpWievH7WJnwmGrdtzZ0eYXSorZVS4v0PmzivPqtKUkJzMWbUfLFjeesoyzfU44wFerqaf6uh72Z
	PiEapgB3yzZ2H2JzdUgERUIhKf63UXcyJ5obgNth0gqV0gvzGXuu4s27Gxm7/CE3MzNY5pMGlH1T/
	na8pLyhEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khF55-0003DU-Dc; Mon, 23 Nov 2020 16:52:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khF4Y-00032D-RB
 for linux-arm-kernel@lists.infradead.org; Mon, 23 Nov 2020 16:52:15 +0000
Received: from threadripper.lan
 (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8A4072080A;
 Mon, 23 Nov 2020 16:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606150333;
 bh=xEKbns/7WgyQeJJkCyyk+TdVMhcn6EO3H0Cxj3uEwJE=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qo8/WunnUnWNQraChLH2nJSq+FPK5++L2kjAlEBGKdtoFbx5rnnYG18fwZ56cqDoD
 URwxoRe/MnlQKxKPRQstGnZ7ax0o0BYhMLPY46WK9TsrHvaOCJcSwRfNGmVqSplRlK
 5acRJe8z4SzbEto51p7CavmZgS0pNgmeVhYGeLww=
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [GIT PULL] Ux500 DTS updates for the v5.11 kernel
Date: Mon, 23 Nov 2020 17:52:01 +0100
Message-ID: <160615031130.69876.14111749991085999461.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <CACRpkdY_M4xj++QhRPqX6N3x9YmFNJkz70DnvBj7Ai-dOtCJSQ@mail.gmail.com>
References: <CACRpkdY_M4xj++QhRPqX6N3x9YmFNJkz70DnvBj7Ai-dOtCJSQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_115215_016485_90660732 
X-CRM114-Status: GOOD (  12.87  )
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201123165201.RfQQo7qdrm8h8y1pjQslK7ozeFSDQ0ZbwcUdWN1ssqY@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 23 Nov 2020 15:53:55 +0100, Linus Walleij wrote:
> here are some Ux500 DTS updates for the v5.11 kernel
> cycle. Details in the signed tag!
> 
> Yours,
> Linus Walleij
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: c7cf673399144361e696be5bdf5848a7e6f1053a

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
