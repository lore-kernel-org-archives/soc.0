Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4491C433ED
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 15:49:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AC89461107; Thu,  8 Apr 2021 15:49:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A44D161151;
	Thu,  8 Apr 2021 15:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617896991;
	bh=e0rReV5SW9DETahBCXpGM15Z5v9yHRUujvWue+vyQ44=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LHQgxjJ46Vja4kPIwtVFIjDe4Nb+bbRg8oVVXoazxB9xPzwq1lcyqFvANNMPUbb5a
	 PHIWdj++hDdFHHZCf4TkbVzpnbET5h1UKOP+PPRuhnjdmiSw4mZMIqooEG/C+cKPE/
	 fOlxHh2tHuhKtTP0QVsNGGWdhWOFkxc69MqYJ/75IsJNsNZjOYDom4seVUxUI3gKv6
	 /AfrWEBUK9ifarCzmydviZ9+PKJd6kfEj/Rgh59OM1NBOJydK4wWxrpi9R7EyFK+AS
	 ZaMn3ODs+Oias5Tr5T5lAVeQpccleupQkyqkHDz5BzKCYxch5lckldFmgLS3Mtf1pA
	 JWCptbUq54b9Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	arm-soc <arm@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	Fabien Parent <fparent@baylibre.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] soc: mediatek: changes for v5.12 (second round)
Date: Thu,  8 Apr 2021 17:49:31 +0200
Message-Id: <161789693304.1636044.1039014965097284178.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <14104322-3a6c-e8eb-cd21-a5343a81aa0f@gmail.com>
References: <14104322-3a6c-e8eb-cd21-a5343a81aa0f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 7 Apr 2021 13:00:14 +0200, Matthias Brugger wrote:
> Here comes the second round of soc drivers patches. Hope I'm not too late.
> 
> Please have a look.
> Best regards,
> Matthias

Merged into arm/drivers, thanks!

merge commit: 4a3c88952e13172bde13bbb718265805861bcab2

       Arnd
