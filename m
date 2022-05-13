Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EA5C433F5
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 11:45:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E14E1C34117; Fri, 13 May 2022 11:45:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E6F7C34119;
	Fri, 13 May 2022 11:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652442318;
	bh=loDenPB/i33p7wVvSNquwaqTmHuzHMs+CEPZMwJt8x8=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZhQTbYxgGMmOV1Wspd7z3Wmd5ZS6/iOTeKa1KuFRvEKkEosc8UHbyn+S4+/P9qMW6
	 /m4lHLtvjDTWJ/jfWcITJVAgs6T2XeICK9c0pJHVjfE4NZQ9Ery5WSx3Qy3RrjHIuS
	 OeM9Uw3JCWWYqtQUBsZIS0KM5odA98eq7TKwWow09bC2b0EPgG1qExImKXfJIZWv2c
	 pX9bYV8Mmoc/RNsvTGIyd7f9NTf7vyjHgWvcUWBZe5hn6gMfTWIm5gFwcXcGuoIWuE
	 9h6sI0ULqex8e2E3IBVr8ETP9BbVA2sD77iKGsMPlnNbhdEwQt7FmmJxhqONkv3Wu3
	 A3zYuwEC5ni8w==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: "nobuhiro1.iwamatsu@toshiba.co.jp" <nobuhiro1.iwamatsu@toshiba.co.jp>,
	soc@kernel.org,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Visconti DT changes for 5.19
Date: Fri, 13 May 2022 13:43:38 +0200
Message-Id: <165244216388.2862916.15518433328867118792.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <TYWPR01MB94201E842A2F8E5E9EBF740D92C99@TYWPR01MB9420.jpnprd01.prod.outlook.com>
References: <TYWPR01MB94201E842A2F8E5E9EBF740D92C99@TYWPR01MB9420.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 10 May 2022 13:28:24 +0000, nobuhiro1.iwamatsu@toshiba.co.jp wrote:
> Please pull following DT changes for 5.19.
> 
> Best regards,
>  Nobuhiro
> 
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 9dd7a5a896355515ca3b92da6a5802d0a066781a

       Arnd
