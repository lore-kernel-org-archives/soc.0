Return-Path: <SRS0=ynot=WV=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA4BC433EF
	for <soc@archiver.kernel.org>; Tue, 14 Jun 2022 10:53:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7645BC3411F; Tue, 14 Jun 2022 10:53:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 8DC47C3411B;
	Tue, 14 Jun 2022 10:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8DC47C3411B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F126C23A;
	Tue, 14 Jun 2022 03:52:58 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2FD013F73B;
	Tue, 14 Jun 2022 03:52:57 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	Liviu Dudau <liviu.dudau@arm.com>,
	arm@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Olof Johansson <olof@lixom.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] arm64: dts: arm: adjust whitespace around '='
Date: Tue, 14 Jun 2022 11:52:50 +0100
Message-Id: <165520391924.1036684.7115988357918067029.b4-ty@arm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526204350.832361-1-krzysztof.kozlowski@linaro.org>
References: <20220526204350.832361-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 26 May 2022 22:43:50 +0200, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
>

Applied to sudeep.holla/linux (for-next/juno), thanks!

[1/1] arm64: dts: arm: adjust whitespace around '='
      https://git.kernel.org/sudeep.holla/c/a0bf153f26

--
Regards,
Sudeep

