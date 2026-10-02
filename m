Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223683DDDB1
	for <soc@lists.linux.dev>; Fri,  2 Oct 2026 19:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790967893; cv=pass; b=L+5buA8EVmZSca09mwtsq5xWM5NakJz0XiVhj9quNjtF5aet2d/OoO+bR0RpASMRK3gdYjPXvQA6jNzk6rywkLwTi7EVQO7sIx+gMmmAESXlyCSGw5OWEJtll8WOSDqRzlMi6ez4XjHfZVjc4v7f1lHLyWMwZkeXxfcwIVLOkl8=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790967893; c=relaxed/simple;
	bh=mT43A2Tep9JswOhUqQb+y69D97vYcWJMtoenh+x1GIY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EmUAwHAQAPJWXE7jI2/9yHlr50/gHz2NiZJ1wy6f5D5+GKEju5aa05vi6LMVKuFw2+lHC/c11+Xczz7hQflJ2zAqUK/1fLRt6L5a7EZZfrmZgVK//vP71Kp7w7kmMADrFsNjt4V4R0AJdtUFEJ0zVUeKxRR7lUK6oAax/RmDB5s=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bTxsLJeZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=inw87erD; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bTxsLJeZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="inw87erD"
Received: by smtp.kernel.org (Postfix)
	id 6400C1F00899; Fri,  2 Oct 2026 19:04:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1790967891;
	b=pLQaHS/k5iLX2r+A3DbBrGJtCw7jFGTBirWSzsRj1OK2TIRaX/M55C3lgMgbzyh3+hvM
	 QcM0AxUXH47Axt2rDwF/6YirTif+WGru2dQuXWQPHZ7Mu69VJyZtHnvsyzNkEeXmu1DJG
	 J+njRKkTHmv8USEZnu7McDArO2TqFfF5cl2rE6Pont4aWQP+wWFqW++qYeWMvxxv8S0x8
	 7pcf+s0OA99IZEo4VO/KAtVB8GJ8/oa6e+JtJ10yjnKQzQaIxm/O45GAR0nG1K+LH5jb0
	 k5gDrzTSrg06Ue1YcQI6titXYZVyN2nJ+QHIAUJiNdBpzlc0vTTYH7Q1FDBs3vQg57w==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790967891;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mT43A2Tep9JswOhUqQb+y69D97vYcWJMtoenh+x1GIY=;
	b=mW9nxAkCviHCVYE+FCrKD5JF+WozNH8/ymQ0H4ExMBhfUYxTUGFa0RtxIBADcy2OWgnx
	 lP080F/XpI90g8PZe3WFVfv5wkFU6vW4KJnwUgnOoMrQAf4TSnfbefttyApFuRlUsUXav
	 usM+W0yw/eG7cIzfQ2Gks0jwA8Qi6X7wOulYTtRqoUg4iswEpUwG9a1cP00Njt/+inC/3
	 TSnRtt30bglGZps21pTj2+gwShOIb9hdx42yvrv2j4CS6xkLI06EFSIYS/cSKQZapCii1
	 4YbQnnNP8YQlNiuf0WgiSQ161fbMtL8PcJlyOb0LC3rW3mW9w3+knQ6IkCZqePKVkBw==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bTxsLJeZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=inw87erD;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 920691F00898
	for <soc@kernel.org>; Fri,  2 Oct 2026 19:04:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bTxsLJeZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=inw87erD
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 920691F00898
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692H6DMx1481523
	for <soc@kernel.org>; Fri, 2 Oct 2026 19:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mT43A2Tep9JswOhUqQb+y69D97vYcWJMtoenh+x1GIY=; b=bTxsLJeZGv8eC+/W
	jGA1wA2LoI/JmrTbLM536RXE+y9QgKp1AtNmvSi8alWpMM0WO3WQdhD+UBFj1+DT
	/RxikB/3S5Y94r6TipNrWjqZFW4sMBrtoAW1016kgpgUzeBJEzlHat6fVzICKwEh
	3Irqq/GBabVLZfpp4e1yw4LXIdAz4/xLr6pOXCf1TPysqI5D+ljcifXzJg9G+RjZ
	UjC2X4HVudMY4nY8cjrJqZqQIvKTDEXULnK6QIb1QMkKawTi6FDvWvw4mWhf5xR3
	C3h5raqv8SJFm83ctyfDS9zuwkVM2jPmsX001PAdB0pq8Na/g9BGmZFS/OTR/pZc
	9Pe6ng==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2f3d9150-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@kernel.org>; Fri, 02 Oct 2026 19:04:49 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-6756044f260so545357d50.0
        for <soc@kernel.org>; Fri, 02 Oct 2026 12:04:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790967889; cv=none;
        d=google.com; s=arc-20260327;
        b=YGqFDslT+YY0O02xIta4RCSTwfob/MgatLvxsaIj1Cp+OZO4Edkw/SO4Pg/jLsNo5t
         P2keUagsbd7LAaUfKu5SdB31ODLeMbzTKX6oGEK1I+Net4Z7MwUN0eqMky80Ggp3xN4x
         cOJuyunvNIsnCIhHxIyCWzLfzx+t6vGSQ45lABP3C+T+C7Tdabf6KI1tneIV7HtL3KMs
         xkVLNyd5upXIh6WM+olVLyKHj2h6kIW+HvQsCoizvoHO0hA3nGuiT6bwOAcOnSgl9a1Y
         DwaHX6G5rXR7/sx2A1kPaT90D/IWZ9PHHOsrEvVMAPTtDWkJ3z5rBoF0KFvJd4NCdAjV
         Ajdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mT43A2Tep9JswOhUqQb+y69D97vYcWJMtoenh+x1GIY=;
        fh=7RhXR/4zLAZJFRRGPRgxe38QXXNCWfGtuzFcw0YWvco=;
        b=sCe/Kelkkl/XBc7Nwxtm1fcVlr9SZZhglpNEmGYmzLPUi8DIw466pROr58TXB6D+Qs
         zGLclMj/B6msZEgpIG3XCEVBC9O9oZ8P3D50U2v6vUkeQfubXkCMMJZqUvFUffOGTa92
         +9eMG7gDdEajtRYB51KwFSCwUaFdePMtXCQXxJVjlbKdiQBIN6zjNcT6SOoNw3bZl0WJ
         DDPFVTxlabWScVRngopy9P8GvfxL7LZSUYSAr3FNqav+frKMqh+Mhfj9K02BYhVyZcsT
         q4BWnLUReqYxoNxcnmlXcC1lX0heS9zOnUFuuY6MQ1qUvtzAfS/iWOUXtRFGUHbDON4i
         kvvA==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790967889; x=1791572689; darn=kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mT43A2Tep9JswOhUqQb+y69D97vYcWJMtoenh+x1GIY=;
        b=inw87erDisOHAIAM72HDZN6/EitSXEp7L96gTZK7/fEtGtA8pIOaxjFMXEV+RwyOn+
         8O7YEa8HiJfYOc2v63qSfBPX7JCzBmGONe+z/Rm9jq4L5sTaLi81wQng0di5AMwKN6nX
         cs39MyczUGEjvY4FRxjqr5gRc++AbbippRHniZmmNpLaN6fQXjUfoONbZMZRZKzue1Gd
         YoP1ozaqxOfEi/BjmzDFY+i0xByV5HP8vatZI6Qztn62O8ykIlCkWIrL/oVTSV9yeRCw
         YdhUgGJ7igTnDUaA67O4F1XQ6GeM+b6AbANc1dmZSkE1JinzJuh0PfNHfJp9OU2gvEWh
         UzHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790967889; x=1791572689;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mT43A2Tep9JswOhUqQb+y69D97vYcWJMtoenh+x1GIY=;
        b=s5KbOoSjk5+NZmNZaV/rlXRfEslIRb+hUsicyFGgvZU5wt1aVQK/CfJ5rB+V17MFxV
         V663aoXQWdNE4PMv5JLdiRoghcRMWROwK+gHgbSmOXIAgovBLbTzKy6gNgcrO4kovZBW
         tgQMbhYdW1k7fwhszcUDoaS8rUIWitrwEee25bQVYZYBBPTh3HHxXqt2PI0rqsXuSjKr
         wf40fIxWF191e4vIPpuUbiHqB3DJU4JMYU0R1740Ob3bhx3XUUR9rBK/Chdm5e4Pp5J+
         WFQpYmvODJ/uLJJ0QuTYeUkSVgWUl8k59/94gsrbdwS/rzpr3Zqd028E4mM7jCnwi6dr
         VNDA==
X-Forwarded-Encrypted: i=1; AKwUvBwTIi+iaJhAI54QPoVgQwUMvPeT8EYfw5ICXem9uzcPiTGlbwmedrqnY6QxHXghLmyhwJc=@kernel.org
X-Gm-Message-State: AFq9FYIpczLbqHTWVrAAEACCNDP+oAkHYUm7unKvbESEU6ASfCciWNsH
	xTgvSEnXAAGFaJOAAiBMDtN1nLeQRsBhb6mTBrbWwdkcke1ZqTvoFWZSBri+YyBIiEAmzLaMLe+
	0HVlB6P/RXPuHaoLGkjof4ZPY7/+VTlEcyFVO4n2JmuiXTnhyr136Mthxnxea3oYAcP0VmdYd4z
	7hmiEAAy141NXyjHdaYw+ya38=
X-Gm-Gg: AYBFou2WuSZsVziBI55AtCzJfyaCdNgcU1NIShP/zvjIzOU+csWqoBMyLl5cfHRe/v6
	dqfMtzNfp8IJVUICLzgAh+Fzzv/51onS1WvdoLauvAu712dYIsoN06lpkMuBLyOptlBbmfn0BTO
	0tEnaFgACJhEpu8iu0MLsFVYxSKtu8KnWC9VldZZlKBne2FnMCwSMpj60=
X-Received: by 2002:a05:690e:d5b:b0:677:b670:bbf with SMTP id 956f58d0204a3-677b67014bcmr767078d50.48.1790967888729;
        Fri, 02 Oct 2026 12:04:48 -0700 (PDT)
X-Received: by 2002:a05:690e:d5b:b0:677:b670:bbf with SMTP id
 956f58d0204a3-677b67014bcmr767065d50.48.1790967888310; Fri, 02 Oct 2026
 12:04:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261002142443.GA778834@rayden> <84c1dc64-6380-42e6-a501-9be86666e5e7@app.fastmail.com>
In-Reply-To: <84c1dc64-6380-42e6-a501-9be86666e5e7@app.fastmail.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 21:04:36 +0200
X-Gm-Features: AclHuK8Hx-gmjoKfPEPErlrdzXMv7J_iPm_txYB5iricgBj9wbiOQUFrLBcfNdY
Message-ID: <CAGgiveXqFFi+nq0834+hwBBnwJssh16aayZBgh0toYCVN+OMmA@mail.gmail.com>
Subject: Re: [GIT PULL] OP-TEE fixes for v7.3
To: Arnd Bergmann <arnd@arndb.de>
Cc: arm <arm@kernel.org>, soc@kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: n2AfB_6cAF4EnfJF-aI0w5h6YXAM_ZHg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA3NiBTYWx0ZWRfXwVQSyB1mEqx8
 qtlu5RSLEPuAZ5eDjD4NeoqHev6bGUSYxZ3seWmneEGVgwzSbNaqaznHX4jh4IRC6dJEkfYvIcV
 MnR/F1kRH1zjpKCr9bomigA4vdw200M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA3NiBTYWx0ZWRfX9cd4IxCRCWMU
 3DNk9zPYdAmWJglt5xlY1OGt+ecbDpdNBAXGHQ7rUBTFY+v/lFsADbIOyLJT+SkGnJwCgC3OdSG
 tVW5n85luQ55x9NNBcUu7+BS/e+59cY4CAeHPOgy4CZl0/5Q03qUf23UeU87RojDS9lt46l6+sW
 BW+VWXECQc7wRiBPntX43G1Y44VagxzHcl/YuwbFWmRXBmtMFnpx9+sRVGwL4DPuRKk58jStzlO
 5rYKH+dcfzWwWAghP/zdEajbbKKMT0EXv0PiEE12nNkTY03CUWSue+LijnElqdi+SLl42pNm8Yc
 r7mBAYWfJ4BfpEwlUplPquveIuDR3NcW8soir501/ZMSuntgdGMkAx4B/StQf8lgNqGakPnb3te
 htOQTPb6EXAe3IYLolWpDKyzA+3veBcCqAadAcMIq/dXENcuGjAuc000hAd2WjqqKuvC4F7XcIa
 KcR9LCj2fe4F3fsQWQg==
X-Authority-Analysis: v=2.4 cv=L9SI0OT8 c=1 sm=1 tr=0 ts=6ac00051 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=ghIncmqAs50lZ5yoykoA:9 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-ORIG-GUID: n2AfB_6cAF4EnfJF-aI0w5h6YXAM_ZHg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020076

Hi Arnd,

On Fri, Oct 2, 2026 at 4:59=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Oct 2, 2026, at 16:24, Jens Wiklander wrote:
> > Hello soc maintainers,
> >
> > Please pull these fixes for the OP-TEE driver in the TEE subsystem.
> >
>
> Hi Jens,
>
> I noticed that the contents of this branch are not in Linux-next.
> Is this intentional?

I made a small last-minute change in the commit message for "optee:
register TEE devices only once fully initialized". That's why it may
seem new.

"tee: optee: ffa: support shared memory offsets on large-page kernels"
is brand new.

I thought it was better to send them sooner than to sit on them. Both
are added to my next branch, so I assume they will show on the next
update.

Please let me know if you want me to keep them on linux-next for a
minimum number of days before sending the pull request.

Thanks,
Jens
