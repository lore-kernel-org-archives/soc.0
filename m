Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA4BC43334
	for <soc@archiver.kernel.org>; Thu, 14 Jul 2022 16:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 925A3C34114; Thu, 14 Jul 2022 16:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB7FBC341C6;
	Thu, 14 Jul 2022 16:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657814645;
	bh=1xKjdGNf6VXJiWDHhybFu7e5UYpLrNxQdNLu9GCpljk=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZOxFNhFJ31w+k1/QY4O/959tJgsDBo9DrTJB9jDYCIxVqRORAU+jYFF9/J4Z1jw5z
	 3Hl5Vw5jy18ZJ5EDPPEmkXaCXauiMyTgiFcVkyaLwi5GWSLkijU/2Co47mh16Xtxd7
	 jYRStksOtbl0Rv3Z4hb1DoGplaT37EFxaDs0UlN8tyZkJa9A+QQdy3hznzoHxRaUGp
	 0BRutsoUqmwnRyw0lLskIMWJhGfkVNdeqxMR+v54WOY8QN2FS4xAxXoL5LVOaE+K7y
	 eUZVkIHXAtQPqpRXnTlhiLzSFnsC3jrCYBAccOF4X/4+nOyHEU04Dwmgz1HjhZPFgz
	 BuhqA5waRJhrg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Andy Gross <agross@kernel.org>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	linux-arm-msm@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Xiang wangx <wangxiang@cdjrlc.com>,
	linux-arm-kernel@lists.infradead.org,
	Rohit Agarwal <quic_rohiagar@quicinc.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Miaoqian Lin <linmq006@gmail.com>,
	Jiang Jian <jiangjian@cdjrlc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Qualcomm driver updates for v5.20
Date: Thu, 14 Jul 2022 18:02:23 +0200
Message-Id: <165781428754.3197247.872910199037987836.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220712021830.1271398-1-bjorn.andersson@linaro.org>
References: <20220712021830.1271398-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 11 Jul 2022 21:18:30 -0500, Bjorn Andersson wrote:
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.20
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 3c37074f0d581b6c73f066b2ffab0c3d4826d623

       Arnd
