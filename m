Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAB3C433EF
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 16:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 492A3C340F4; Tue,  8 Mar 2022 16:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB70C36AE5;
	Tue,  8 Mar 2022 16:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646758478;
	bh=6hY2q2Crf5vC0YNZeS36GVS45QSVwl2lUxsUydOqEHQ=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jG2V6IZeCOUBVyHxKbYLsq2Y8MKuH9GVoYC+mcS45kLJF8oK3NsJ6J8DDRGpYJnox
	 JE7N77b+HFVu8s9iiL72n/w0LTvCVQdajdKCLj6fWLPOPinMcELD8KsVxYr7M3Kpix
	 OsOAFUjkIJ4XAzvPpdYDZbk9mPm10xZWbe6sQf+9o+5GvrBeJzgI4VNssCeoSQetlF
	 k3Fo3gqBGtWGny567RMakDS3go/eZPv6absFLqitO72zFwTUa3EmrVulwxp53aCZOX
	 oHygC78QCC4LoORKrKi4AEWdE6yjRGe5Z5C28d3blVtSg10MYXwnZSYjtWmyW9NcTQ
	 2VWFc2vQ+sooA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	soc@kernel.org,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL 3/3] memory: tegra drivers for v5.18
Date: Tue,  8 Mar 2022 17:53:58 +0100
Message-Id: <164675831403.4164581.7565961720303227080.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220228164313.52931-3-krzysztof.kozlowski@canonical.com>
References: <20220228164313.52931-1-krzysztof.kozlowski@canonical.com> <20220228164313.52931-3-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 28 Feb 2022 17:43:13 +0100, Krzysztof Kozlowski wrote:
> Tegra specific branch.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 42ba417307bc52604e2a405593c9093d1d23220c

       Arnd
