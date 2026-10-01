Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916E4497383
	for <soc@lists.linux.dev>; Thu,  1 Oct 2026 11:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790855899; cv=none; b=XSfIFSku9D7vBzXjk4x7gZKSENVGgUgRiqnl9vCwmcNYenwqto/2o5TYaEIf8Yb1e7eQRfDR594xR3I5gu+zfgbZUmyfwYETHT/q/ySzL2AqpsqtxvVH8M2ukKA3zoekXbJV7QfR0+fGfPNFJdiFV8uB/QhZRHeVBJ/gbMRrgo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790855899; c=relaxed/simple;
	bh=h+KW7rCz0v5ZQE4OX7By4cCtiMftMMa/NOkk5G8esQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQErVbTaO1TqHA1yaw6vP5hDwgS6/969qL2UF3i/0qBKH/kf0V3rkGY3U8p+3ZdBjJs1uCdTXAo2EQza88rCSgOX0JAG+Xfn6wKgx2UFdVoHFOFRLhbFmEZ+DpvuoNBnf6n8vXG7nIXle0NF3o/Q6FULvEm9o+CSxCOysMN9//g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xd95PvYN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xd95PvYN"
Received: by smtp.kernel.org (Postfix)
	id 0CC6A1F00899; Thu,  1 Oct 2026 11:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CD551F00898;
	Thu,  1 Oct 2026 11:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790855894;
	bh=vQGaIJbAx/83CgDA72QToiN/jtnCemfH3eZN2R4LHts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xd95PvYNx5nvAAhUGZATKdFPC7W59yZh3Qbebau7+obP+aa7Opr+y8Y/X/+7KZnsJ
	 54MMTuOpdiWQsWW8l1ZM9e+xr/JyFzJaZyVTobWkheh/qj7LC8+2s/aDybLlw2zkKQ
	 bmMEEoDpEFA5UryTSOuV26Qq+DwICZ4zG2MTgR8D/lVfjgNPRR6CPYDcFwic4V+9kU
	 MxEgGC7MThJ6+07teMdN+e8sV9driq7PBwgJn75ZTO/gErSLwdXfac0Q68CXBfPZ4j
	 mSw+ZNmNCpq2w98KUE/Gp3NnnO95nzdUmR6hcOQrzjLa0Bg9mkuDBR5S0qeYq4i+0M
	 eoCj3XzE79fYA==
Date: Thu, 1 Oct 2026 13:58:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Luca Weiss <luca.weiss@fairphone.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Alex Elder <elder@riscstar.com>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Wei Deng <wei.deng@oss.qualcomm.com>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Luo Jie <jie.luo@oss.qualcomm.com>, 
	Reza Kurniawan <imkyufie@gmail.com>, Umang Chheda <umang.chheda@oss.qualcomm.com>, 
	Aditya Sherawat <asherawa@qti.qualcomm.com>, Dale Whinham <daleyo@gmail.com>, 
	David Heidelberg <david@ixit.cz>, Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, 
	Greg Ociepka <greg@ferrisoft.com>, Hongyang Zhao <hongyang.zhao@thundersoft.com>, 
	Jason Pettit <jason.pettit@oss.qualcomm.com>, Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
	Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>, Sachin Gupta <sachin.gupta@oss.qualcomm.com>, 
	Sreeshankar K <sreeshankar0910@gmail.com>, Xilin Wu <sophon@radxa.com>, 
	Aastha Pandey <aastha.pandey@oss.qualcomm.com>, Abhishek Thomas Varghese <tessolveupstream@gmail.com>, 
	Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>, Danila Tikhonov <danila@mainlining.org>, 
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>, Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>, 
	Jan Paszkowski <jan.m.paszkowski@gmail.com>, Jie Gan <jie.gan@oss.qualcomm.com>, 
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, KancyJoe <kancy2333@outlook.com>, 
	Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, Monish Chunara <monish.chunara@oss.qualcomm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Oleg Keri <okerixx@gmail.com>, 
	Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>, Richard Acayan <mailingradian@gmail.com>, 
	Shujath Mohd <shujath@outlook.in>, Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
	Xueyao An <xueyao.an@oss.qualcomm.com>
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v7.4
Message-ID: <20261001-married-reliable-skylark-7b2ac6@quoll>
References: <20260923025156.407351-1-andersson@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260923025156.407351-1-andersson@kernel.org>

On Tue, Sep 22, 2026 at 09:51:56PM -0500, Bjorn Andersson wrote:
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-7.4
> 
> for you to fetch changes up to 32afff1e816e10185bb571aa9d89dc2eb061d548:
> 
>   arm64: dts: qcom: Add device tree for Nord RRD board (2026-09-17 22:15:17 -0500)
> 

Thanks, applied

Best regards,
Krzysztof

