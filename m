Return-Path: <SRS0=W7ES=FN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65337C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 20:34:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2235B22C7B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 20:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2235B22C7B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d8+QDPxsvxdEcp0vmhT/3bMwbQ4EuPrXRwPFRFR3yvg=; b=dUFdWh7DzRH2mEgYdY+8ANJpV
	FuNTkOlx0hsV2Z6L+vVSmLfcuu11w8al1offrAyonea7R3aS8W4yVgx2oBsrZ7A9rORmtAlDj43lo
	2AfIL/QwI40PK67IY5BB8D9xwOvtRjEODZaU8nnbUoPUNspE6IACeKNxbX50SCzhg4LnGo/5yVDQl
	zGSE6TP1gWiote+L2BLeDlgYII9I2PU3krTeS+vwrPAcLbHws7x7FqZXMnTk/Yh1yE/0HL99G8RLb
	hlR2nwVY48b3V/apv5qDRpsEeWkWUFYb+1C7mzzj67Cez3v8liLWLAeo+I637EjlhAcuiRWrIB/3X
	0v4ah45pA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn690-0005Uy-QJ; Wed, 09 Dec 2020 20:33:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn68G-00051z-HE
 for linux-arm-kernel@lists.infradead.org; Wed, 09 Dec 2020 20:32:19 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, arm@kernel.org
Subject: Re: [GIT PULL 1/2] soc: samsung: Second pull for v5.11
Date: Wed,  9 Dec 2020 21:32:08 +0100
Message-ID: <160754591589.2474728.7440733402557449514.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201207074528.4475-1-krzk@kernel.org>
References: <20201207074528.4475-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_153216_723638_AA895802 
X-CRM114-Status: UNSURE (   9.26  )
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201209203208.r9i0HwF9tapf_IZDIlVsMNYUsjLOMvU-MDDV8IfE6DM@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 7 Dec 2020 08:45:27 +0100, Krzysztof Kozlowski wrote:
> On top of previous pull request.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit 124f035310adc781d91cdf0b7c6e4fb3c7e43e23:
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 19cf6e6d402a7732d39570afcdd3b8a0a66df652

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
