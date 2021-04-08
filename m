Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 098D5C433ED
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 20:03:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AC6B161104; Thu,  8 Apr 2021 20:03:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2ADDB60FDA;
	Thu,  8 Apr 2021 20:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617912234;
	bh=FRDrpqf2whLb4ENIJlbQcXJYZCt0R5EwgGMdwXSuFfs=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uC6O3OYXTDZA4vsYMgc8cM44X+21rLqdPy2VZU1e3QlM+dGsoWqwqlDcMM/IGi+hX
	 GXitjvPj5hCrHnZk+o3qNDQM9CzOq1rdYImgs3b5ikD9ro9RZbBn+jO9zF6vgouGVD
	 kKZsVODfor3fAwFZBmpBxr36WyC5g/UQUUFDTfyzMcThFqj+FQikLVkAJBjaIh9S99
	 l5azgWK5vOexL3mWjsvvsw+2HWm/4Kg8Kfyv9CjypPDIeqRQ72TPCI4prICSMllDEf
	 gOEOQ92z0QJNzt5owrIOYJEo4OkCne7gYZSQHx1iLJZPbDcpykVlYsIItKxLyKzzcl
	 oP8/zdrKb9FVg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL 3/3] ARM: samsung: mach/soc pull for v5.13
Date: Thu,  8 Apr 2021 22:03:32 +0200
Message-Id: <161791219775.1659621.2558335087414364117.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210407065828.7213-3-krzysztof.kozlowski@canonical.com>
References: <20210407065828.7213-1-krzysztof.kozlowski@canonical.com> <20210407065828.7213-3-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 7 Apr 2021 08:58:28 +0200, Krzysztof Kozlowski wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-5.13
> 
> [...]

Merged into arm/soc, thanks!

merge commit: a0c97a6bd63019707f16d36812a5aa2fce3fe29f

       Arnd
