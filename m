Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7CDFC433B4
	for <soc@archiver.kernel.org>; Sat,  3 Apr 2021 20:57:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 50FA961357; Sat,  3 Apr 2021 20:57:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A442A61247;
	Sat,  3 Apr 2021 20:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617483427;
	bh=KBMgWGGAd1vr2YjSeLapUko7SpOAJTIZz3qSsywmxlQ=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ff9+09Y+4sJIkwphg3y66hyRm+b6COLbERnz/UhHibhnvVg8IaYWB1175D24BqYKW
	 A3seAHZ3vU0CAbzOXQa2CRSbyjzSHOUc9/WRh53G4Rcof2BrlHZW8f3Tu06lBKkILD
	 XvmkqokhJ/bV9HvmGspQUjpCC32YAKrUi4aQWqmdTFilC0EqK5Cv1cs2st+fVP29ob
	 Fvx6DzAix+P5AWeL/tvr+FfasaRUFqMvTXamVZHUNmw/TRmv5lSmGriJnvrsmnGVNP
	 Az/CXoYk19URCH38y9G7WVsv3bdFyZHVOH88chENSdjuBXLJMRzKo1Gi5tsDeXssDL
	 ISiCXp0UnGRrQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [GIT PULL] ARM: mvebu: fixes for v5.12 (#1)
Date: Sat,  3 Apr 2021 22:56:56 +0200
Message-Id: <161748341017.896324.9953024889088248771.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <87a6qgctit.fsf@BL-laptop>
References: <87a6qgctit.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 02 Apr 2021 22:37:30 +0200, Gregory CLEMENT wrote:
> Here is the first pull request for fixes for mvebu for v5.12.
> 
> Gregory
> 
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 6bf18bbe1999c4ad4875bb7205df70e1037d17cd

       Arnd
