Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2A1C433F5
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 16:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8E490C340EB; Tue,  8 Mar 2022 16:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44583C36AE9;
	Tue,  8 Mar 2022 16:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646757913;
	bh=Y3ABlIJKQYWE0T1csyqIk6oeXepG9iL3Nwo8XxPJsnM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nBmhozbbUA8HXbjFY4xM1FmshpDYiTb61Jw4eQ4REEBlK528pEd6H01HlxP/IWRY3
	 975/QISFERxUj20VX54Dg8of948G3YKUa3dL1B03mYsjUSuaOj1q/ilpE8kctqmFx/
	 2WzH/3gygLgt2ebWT7hAtBHWeVkpMwnvBqxl/aZV0Si186VmDKkwGTyN3GfRBbq6d+
	 W+Tumy6w5MdmQvZXtBqwMalEkTwUqaR0CXB9LO9UzeQ1f9TNO6236MKRZo3p/xftrq
	 HdGw8nJp4BygWdNv6jcyzeIYi+iWigrSn+uMl5PlE1GaxjKhRKnmM2kkCSAV4hQ3Wj
	 /Zr8SqJGPQ0Zg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	bcm-kernel-feedback-list@broadcom.com,
	khilman@kernel.org,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Richard Schleich <rs@noreya.tech>,
	Matthew Hagan <mnhagan88@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	olof@lixom.net,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 2/4] Broadcom devicetree changes for 5.18
Date: Tue,  8 Mar 2022 17:44:38 +0100
Message-Id: <164675781083.4163171.14483438361565549964.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220307194817.3754107-2-f.fainelli@gmail.com>
References: <20220307194817.3754107-1-f.fainelli@gmail.com> <20220307194817.3754107-2-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 7 Mar 2022 11:48:15 -0800, Florian Fainelli wrote:
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
>   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.18/devicetree
> 
> [...]

Merged into arm/dt, thanks!

merge commit: dd5d787f481d999e0f76a82b112e4605fe214541

       Arnd
