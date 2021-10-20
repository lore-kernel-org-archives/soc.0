Return-Path: <SRS0=+LcQ=PI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77114C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 16:02:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4462E610A2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 16:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4462E610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CKN9EogMZAoqYwvmL2VHTNfbgVk0AoWAi2rlpYtaJLU=; b=iAHNs1UCTzaGJX
	0m6KoiDPAr/2dofQT0tUBqCqVXOpAQZKiEac2m77HPYiSUZJ6aBV6Cjz0jCgXjgLQ9jseLoN4AMyF
	88lOdNqWlHdt/YXF6Df057unaIcCxTcRSq0vnpPk4DFXg7QD1pFQ1vKUNrcKeeRR/Q5NIofi4is5O
	vSbGz0ztkpOBi0a6Cz8cUBfGeLuxa+DWmMsQ9XOd2gOiuvAR6YntuNhWhfjFHdpu1BOPWzgDHdlRn
	70Cr9YccQWZpSyCEBL7fxgyen4GdI8iGhjIJm64OiGY6x7qAGeOmYQYIj9wfqzzc4H9v9Uw7vd69S
	fHwsZOvBPSrMDW2RMTdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdE1R-0059yx-1O; Wed, 20 Oct 2021 16:00:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdE1F-0059wu-4r
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Oct 2021 16:00:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E7E361373;
 Wed, 20 Oct 2021 16:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634745644;
 bh=9+oQ5QtKkswCP0/5OyFH3wR7AwYAn4bsNIz73pLh23o=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cXxDLOTM8tatKT7LiwMzFLdwZ6KRHpsqlQWiFqV5CVHEnbRTdp5bEFwBm3910+JVz
 hEzPe9nqudmgldxEmVGTcdUcqjYAR1SPJv5iSGlpUeyiXr5bgcmu9KJN36h8SXACpx
 nFJ8Aj9YMnTfNFVhZkRLGuoIkXu7PDv0p3d+G91mvorfVY7xt9pTeAlfKuU0gye314
 XoCqY557FdiX6CDThN0pFJ4YJG7JPef7FA1VRGuCNIqZAXGk6THSd6RuM7+VsbZgk6
 dlo3L6cfRq3wCyECOAZPc9ou2OXGsvFOdyis2HtQVwclsdlb9M3kLBFzYfe5aFxTKL
 Ho5CyjIaQ63mA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-sunxi@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@siol.net>, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Allwinner Drivers Changes for 5.16
Date: Wed, 20 Oct 2021 18:00:32 +0200
Message-ID: <163474562261.2274953.5755457766453207269.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <ad0aa469-9e1b-4bb6-a116-92648ed774fa.lettre@localhost>
References: <ad0aa469-9e1b-4bb6-a116-92648ed774fa.lettre@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_090045_238299_3ABFE64B 
X-CRM114-Status: UNSURE (   8.68  )
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
Message-ID: <20211020160032.vtGUgb-C1jccFJ_R9FyU0Jq2VkmQTpH2Ug-FNPu8QIE@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 18 Oct 2021 10:02:01 +0200, Maxime Ripard wrote:
> Please pull the following changes for the next release.
> 
> Thanks!
> Maxime
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 409d8a9c1dbe504a28b5e5c2f7ecdb8be9f9da45

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
