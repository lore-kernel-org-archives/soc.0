Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C612EBBB7
	for <soc@lists.linux.dev>; Sat, 11 Apr 2026 08:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775896719; cv=none; b=Su8fhT8WggOV+j5Trqa1xlAtRCx0hTNaqojY0FjtBOvCR8F8K1/peJSYgVsZh6pZI/HnHKMW95xyJ+/DtfcjHVol7DFDM5/GKKx7KVf4GmIKX+IT+6iuQb+w+v7nzuG4yt1Ea+lCnOrHJfc0ex90o+dQtMaEd2jgP7wJKhd69Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775896719; c=relaxed/simple;
	bh=WJwPAsSYyhBmXwIaIw1VAto7NG+MlEuN2t6R5r+/qJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eVlYVhvJKt4rQiMXBvgkasrlluOhw+ZYbAQLyyQA9ymjGAWrjU6QSO/4JY7p17t5KXzRKSHCKpv25NEt0lpHRNUgpDUlBk87k6ANQjw/oDHqFDUHmnTo+Fp4E82XZJ6xEN3Bp+X4VHi4mggmaGzttCihV6OBWKFKRblPc0qiy8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KojuZtuX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KojuZtuX"
Received: by smtp.kernel.org (Postfix)
	id CD5ACC2BCAF; Sat, 11 Apr 2026 08:38:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631EAC4CEF7;
	Sat, 11 Apr 2026 08:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775896718;
	bh=WJwPAsSYyhBmXwIaIw1VAto7NG+MlEuN2t6R5r+/qJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KojuZtuXa+vfA+4gyCMqMFo1YA6loJ6n8pXUWBGJKSsrjBq6nD9XMBtxdy95aFDZG
	 upszcPCrjivP+hrJcwlzW4LAnH4rY6Un69RhXgwhOKRxnC5MjZgulSlOOb8M8vhNDE
	 VOJosRb7JzeG130LU17K7XZq9xAzym9kEUWxtqhNmEVgF7T0OdNeia0hvlUg2Cyicn
	 ZkAe80SSGgXH/Zik5Ol0Bm4rsW1Tmcg26AMnCmZjpgwlgybjGKv40sk+gj/YnGh4Wu
	 WvORo8CJdOUvDpC8VaQ1fup7Z+7V7/ZxHVnGRjQdzeCnDD9D5yI5OSRUT8VLwCpTM3
	 VBdHT3LBvtkoQ==
Date: Sat, 11 Apr 2026 10:38:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Paul Sajna <sajattack@postmarketos.org>, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, 
	Sudarshan Shetty <tessolveupstream@gmail.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Casey Connolly <casey.connolly@linaro.org>, Jie Zhang <quic_jiezh@quicinc.com>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Alexander Martinz <amartinz@shiftphones.com>, 
	Amir Dahan <system64fumo@tuta.io>, Christopher Brown <crispybrown@gmail.com>, 
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>, Qingqing Zhou <quic_qqzhou@quicinc.com>
Subject: Re: [GIT PULL] A few more Arm64 DeviceTree updates for v7.1
Message-ID: <20260411-amusing-hot-koala-cfcdaf@quoll>
References: <20260406132007.2264408-1-andersson@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260406132007.2264408-1-andersson@kernel.org>

On Mon, Apr 06, 2026 at 08:20:07AM -0500, Bjorn Andersson wrote:
> 
> The following changes since commit b683730e27ba4f91986c4c92f5cb7297f1e01a6d:
> 
>   arm64: dts: qcom: sm8250: Add missing CPU7 3.09GHz OPP (2026-03-30 09:35:01 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-7.1-2
> 
> for you to fetch changes up to af241225893ac4933bb8f0615f2dfda8ea2326ce:
> 
>   arm64: dts: qcom: Add the Lenovo IdeaCentre Mini X (2026-04-02 16:08:54 -0500)
> 
> ----------------------------------------------------------------

A note: your GPG key has expired. Consider dropping expiration time. At
least I am planning to drop it in my next keys update.

Best regards,
Krzysztof

