Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AB0C54EBD
	for <soc@archiver.kernel.org>; Fri,  6 Jan 2023 20:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 36798C433EF; Fri,  6 Jan 2023 20:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A08EC433D2;
	Fri,  6 Jan 2023 20:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673036661;
	bh=N1+P9YLmQdjf+UJIqr8Jy5NEmYRqvXHG5G4OJA9v9V8=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aa+9MNkabD0N0gcLGy1lNtw+sbbIkwE8dmYO14PvnlySmjFiKrViF76qTz2vOTTjo
	 BqRYor3F4lnnx/4gVAk12fymKnuv3JVFHTwRdo39tf5vfnxy6qFii4rcQ/U1Pq0wsY
	 WWS8lz8vE8+MhC0cunV5Xs7orawO7Hya25VEzTzrSLFLGfpdCtTiwzygJHcoVs2scd
	 M50AkeiYJXl3VuWkjuIpmQ5Lxy+GDAGxPBKTJ1pChr4MZ0AjnJWg8T/AwmHhr+hMyF
	 RcYDGr+GvXHJdKchfQDmGN/rn2ld4JlK8VdzOy8bRB+WvQiDHjuCCq5IdLVMwI3n69
	 1yu71vh9iBkpQ==
From: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
To: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bhupesh.sharma@linaro.org,
	soc@kernel.org
Cc: krzysztof.kozlowski@linaro.org,
	Arnd Bergmann <arnd@arndb.de>,
	agross@kernel.org,
	bhupesh.linux@gmail.com,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	will@kernel.org,
	konrad.dybcio@somainline.org
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm EUD
Date: Fri,  6 Jan 2023 14:24:16 -0600
Message-Id: <167303665349.1802272.5463992029078563468.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221231124852.3283597-1-bhupesh.sharma@linaro.org>
References: <20221231124852.3283597-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 31 Dec 2022 18:18:52 +0530, Bhupesh Sharma wrote:
> Now that the EUD (Embedded USB Debugger) block is supported on
> several Qualcomm SoCs upstream, enable the same as a module in
> the arm64 defconfig as a module.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: Enable Qualcomm EUD
      commit: 6878639ee632b9f873a6ede788b06a4aa509f20c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
