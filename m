Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD07305692
	for <soc@lists.linux.dev>; Sat,  3 Oct 2026 13:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791034880; cv=pass; b=RH/INmIS8QGYnqjSD4eFMMcqp2PVrliXlPj3bqdKFpE+W0/7FENEYEEiTsMkYKzUK8ahWPBobmAoy6WdeHd7Y2ILQc8kVh9dwq/uxrpht6iiD5SH/LoweB023GipHRmwybHZFGZF8n3ckqkhuQ9JLAabF2sSt6a1FLoBOGSMSrA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791034880; c=relaxed/simple;
	bh=UOA6JD8sCi8WMj2yDPrF0LvtP6kjcvibA/xPsZyH688=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MPn5zQO23HxEPaO72dNxJGcx4GWT7np2OaOsg+Z+pJS9fUdGUi+oxm5+0RB02sGRIgNk22m5I6ORjq9g5Hf1eeowICqCcchLpo7Ul/Rz3F/PuKwT9LzftkmIgN6yJSx0jYi/lCig4xypYbr3fiEr3DFRhBZV5uixWRZdHIaCJ2c=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SXQSXwFg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NTQ7xVTF; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SXQSXwFg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NTQ7xVTF"
Received: by smtp.kernel.org (Postfix)
	id 09E6F1F0089B; Sat,  3 Oct 2026 13:41:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1791034878;
	b=RXHDNEbZdcmIjw6m9UgWSU091siRMu1jBcBw5+wn4vxYFt3wEtDg+b6BXiQ9v3HaEwdc
	 pYpYD4ntI6MlvEZbZnrX8nNvvfVdv0w1Ha4ItxMgKf7rxAHmUumw22sR8fRSLEFGk4ZOp
	 gCEvoTk+ZmzcRfarxRv6FgW0/50ILKYvBL8G+sCNw6M9u7hluNbGH2fYyJyUJB4p29E67
	 zyqmVjW7mI/kUZGQANpkVeczeH9oD3YTvPqdQ487hyJ5kAaFld7B3VfeUi68/9XVrCTFi
	 w8INqFqUOq2M6zeXU+2NYCYCCRJbMNmD4bfbcypSUlNH4f3RMqToEj/ii3SjjANhQ+w==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791034878;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cWZG9J8ZvfCaQmhFeJRAO4+EQ2nyl7qNd4JtnATWve4=;
	b=X2E/RghmrrYWiTyxk21u5ahQ1DKnOd+1aT+O4cU+n8YIuZQ13v/qB3JOobh1WVJ03vft
	 MrCIpg94BiwfkP38ycu6penoRsi1TkRzVT1c46pRiFykLs4KF8rC+hD0v/eytk3lkBb3S
	 uHCLdFIQNbObwikouuHyuyj26TrvghE3mEMjn5pdwR6ZRREExV7YFdxOu0WJjTawSWKsT
	 UecxJdGhe2XLakQgabxNfA0TTSI+Fo3KZiANTwHt6/4UHh9ehyoryMgQIQ4H1B8eSkYHn
	 RUtZsS1Bg0+3lEowK6c1c3JSg5/M6Qb5I+YFvJdhgE0AXPVpEp60mpgOAHtuyRy7yhg==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SXQSXwFg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NTQ7xVTF;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 798AE1F0089D
	for <soc@kernel.org>; Sat,  3 Oct 2026 13:41:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SXQSXwFg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NTQ7xVTF
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 798AE1F0089D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 693AtqT2093196
	for <soc@kernel.org>; Sat, 3 Oct 2026 13:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cWZG9J8ZvfCaQmhFeJRAO4+EQ2nyl7qNd4JtnATWve4=; b=SXQSXwFgVMRrid/a
	BwdF9HLD0FqOzaPrHW5GXEP8CG3zGsggqxda+3R3aU4tFxcohCYJes64m1P/uwcn
	Ay8N1QDUj3DfEuSRhEe76Nnne52A7tDlVYzG7DDzcleN2EkIl1GqbFbE3P/+O7c4
	NB7UwAa0bvd/mYa5zAPq4JOyxeU+/9HQWKSgKd90a2wDLJ8wSThC28frj+ng6nUK
	abQXfWSZ8dcz5OTFrMwQMd0vK+CfG6FqPaNFiGlaWHBf/67vEomz2ySHCwR0x2yh
	QXI4qYhkTM2HcM5I0+egCQz0JJzSjy7NKOL86AeC23YCAM8mrQ/PadRHu3UbnZwH
	f9XxIQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssu8y8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@kernel.org>; Sat, 03 Oct 2026 13:41:16 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8ae90802d1fso3514887b3.3
        for <soc@kernel.org>; Sat, 03 Oct 2026 06:41:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791034876; cv=none;
        d=google.com; s=arc-20260327;
        b=ZCC39eFXQvBW2Fd6ItpvhIYMTt8v9mV0B4ePYOGZMGYcWZMGOWIV83cUUbOzar1NEM
         0RDdnhYYj2jyV82EBPK+lF2o3ltrZAWuePmDTPFfL/htbHocndevkRngZAQSp7tfte/r
         hfcFLNATZQWwlB4SXDyPmzYSSD+/TQI/1kExjGG+p5reRZqSLCNUz0c9M0qEJkYkfAvY
         iXtpzkdvwWc4s3DH2Di9Ll1cNxhgWCjDDGiZIiI/a2sDNULlbse/u6IIvUfHyMhUMvcH
         fK/ql9uAU6bOLHsXrFocYKJi1048UszTDZt8ikA8+tFt8GSjJRXySIHH6jE+z3DWbLsm
         1uhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cWZG9J8ZvfCaQmhFeJRAO4+EQ2nyl7qNd4JtnATWve4=;
        fh=CBQRSihHiC+UjzTIo/NaLQOCNN8eckwzD/OZWHs/mZE=;
        b=nG9Q4ceB1loKZi5gAZVoQgSXa7pdBr8SBbnAPRteQt67zlmXS5tt9+9YyjJbnpBC8B
         XuyNcZnyH3gzlyo72UeD/WoEQx0GIGZFzZvI9/Fy2MYp06Y36hl7HW2Co3tKbGvHaGW+
         PZjSdrrYkd4wXIzvdzcSKqYHgGVqI5w5iKt2DjOxnpKnoSHr/YR1NcNtgjzraUyxRSCc
         fLT/3er9t4HuOcv1Sof0PWkESUiHmhiFDJg4muJe1C4v4bGVx/QrVMUMVNdMnqfPRlFS
         7Pubbke9CaY5ob6qe+orZKG+BwJagwwCXWxz4rxi+Mbke/PfGivYqrWXQ9jOUKkSRp7H
         xR1A==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791034876; x=1791639676; darn=kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cWZG9J8ZvfCaQmhFeJRAO4+EQ2nyl7qNd4JtnATWve4=;
        b=NTQ7xVTFIEMd4v57rWXwUcHuwzI9Ajqt+OwYXrbY1qjFmZ/apsvCVeheIgiNE12li7
         cRjuER43B3ntcqx06hOV/pEwp8TIoPHyr6WZynWLYVCHkM7flgbUfGD02AApiTwiBg+6
         5vqpBl7enoRwA08gXMfDyu3+9kt/yjPoJ3MNg7SEKkw36fBMZvCE8atxwZhspZcyWs7K
         lqzatEFa57QKj7RN5g02wNye/LPo8BJsgUJMlLyHPnB7lWnACnl2X7aHsV2gU/LANuTX
         Bs+zrDBK+DND89Bn/0Np6sdzss9agB252OrUrm7X6VRisnWaHXUKZbcI9J9aeEMpE25p
         Pi6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791034876; x=1791639676;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cWZG9J8ZvfCaQmhFeJRAO4+EQ2nyl7qNd4JtnATWve4=;
        b=Rhar7NQbmIzu4FldURlQFSttHWI6aj6WJssm0GJpEjZbmtUOVuLaLVjRHGbmJbkVLH
         3PgT6XMqOTDbR6e+jZCO1YY9BX6Z+Do+4WF2Ygr3TlO7zW98lYpJSUOwAT2Symk0n09F
         dfKvljrAb0T/YkZeluw4YgmRZwfpDXi1d3bx6qxTnf+Vavz9lvUDQ6V0Rv+2LKZvkVMj
         rAp4RK3a5tb6RY2u5QD6Et4VRvtv5d5atw4+rlYfJzoqCScHp8jOgjZSrHMNqTbEWppJ
         MtbKRbDNqwNcZbqvx+VuS/Abl6YVaJXYlSAMAuXKgPM28+FE46LDmcxB1iqdp83Phw0l
         bfTg==
X-Forwarded-Encrypted: i=1; AKwUvByhBGMRbZzQJkFCOt0XDW7Ck1aO75IRHk6nscrMXUUoZypyVh8oPivZakGn1cYGG0a/7PA=@kernel.org
X-Gm-Message-State: AFq9FYKk+atShYUgtrCtzh40Bin86fE7Z4Rn1b8oWurqRcoHRS5tZ0kg
	46fVnypYIAOOcYLizrQWx1OdRVxx4jpf8KRzYqxnvWYNk99J7v5yrmJAzTI1fm6rwQwWmZKQU74
	WNki95Qd4czZs/pbccNKzrjK/l/Mqn59Q3nfi+md6uR+rs7H2PRDvV7CQmEQUwpxsdNGZh+Fv13
	13q/XFC4rFRUSvDbfM6d3zQxg=
X-Gm-Gg: AYBFou21vxKuzkss1YEE4uYsbXegdBfaeln4OqusKk5ZLd9nWg/heEBMaEoc3Y0ByP3
	pI5aGt1bbUqKIlfHxjrI7tQPEYFrfOFFFUl46UN+c7kJf7+Db3kQ0y6QTXzFIilh7GQcTnLzbKu
	SkaD00c9irs0dKEEe3459diuhiNK5YgYxwCPHjHsTBTEWfxOirZ2h34LM=
X-Received: by 2002:a05:690c:c501:b0:8ae:9448:14e6 with SMTP id 00721157ae682-8ae94481b68mr11315697b3.54.1791034875769;
        Sat, 03 Oct 2026 06:41:15 -0700 (PDT)
X-Received: by 2002:a05:690c:c501:b0:8ae:9448:14e6 with SMTP id
 00721157ae682-8ae94481b68mr11315617b3.54.1791034875233; Sat, 03 Oct 2026
 06:41:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261002142443.GA778834@rayden> <84c1dc64-6380-42e6-a501-9be86666e5e7@app.fastmail.com>
 <CAGgiveXqFFi+nq0834+hwBBnwJssh16aayZBgh0toYCVN+OMmA@mail.gmail.com> <67bbda51-d1b6-45ad-b798-d8c0e53bd23b@app.fastmail.com>
In-Reply-To: <67bbda51-d1b6-45ad-b798-d8c0e53bd23b@app.fastmail.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Sat, 3 Oct 2026 15:41:04 +0200
X-Gm-Features: AclHuK_AKvv4DXHOJsSyiGB7-fYwv4aODNPt5MiUCJ6CLVwy3uWPkbDG65f1pY8
Message-ID: <CAGgiveWMy4FL+5uCLYYWOx16qPr70dKvq4u1gVdoA0Vpjv6MbQ@mail.gmail.com>
Subject: Re: [GIT PULL] OP-TEE fixes for v7.3
To: Arnd Bergmann <arnd@arndb.de>
Cc: arm <arm@kernel.org>, soc@kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDA1NCBTYWx0ZWRfX1oK+XOX/1hsZ
 lv679YbL5ljSCeIfCG0HtKSON3DfTKq5Gp1CifrzYTAXkx5RVN2/Rcy151F0RlEOuS33/bBxNeW
 KcgetVj7d+kVUHGUyJlUNmhURM8inFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDA1NCBTYWx0ZWRfX2mQZyJW5gqBr
 tzzvjG5p1Tp6pgnkmvTrDPRMH9r2MoyTtKfPTNjVtFzeTJFQzyyAJCbUxkBZiDm1tSysJhv2X9a
 B+eFMXYYjoHK1O3GsV0QfmhQrSiVk087BsTiWUk/2FeJtxM6ASbCq+4CI1mAURcn1fxST83Xb4/
 U5hE6XoZ5dEpBs1QGvaV4AzRd0JlMmNatps2bfNVTUTzrFDq+neyg04VvBu7fLu4ihGyCpdUzlk
 B0LdR0zJtKR5ECHWwzHIkd15y9PHWIb9WjBJHkV3G5T5fd7W3gIsGUfxlUhTVtaXMhKp9ESQiAK
 gOVH67751fVTe4MTOnlb/8DSQ+PBuDELCyZFo4HrjuHTcrLBz+dzJK0+HlT+4bw0b0guY5lgvPj
 RFDGyHPGgZIfjUba4GsMMVUoSYV2VltQDd0VNlw2fLMRz3Sc61tpIM1BI5hDd6kZsj+Uyd5WJMy
 K7Scz84yemSarAIlF8Q==
X-Proofpoint-GUID: 0xsZJOpc4rvqWZ-n6RDLU8xYmwxmKAWS
X-Proofpoint-ORIG-GUID: 0xsZJOpc4rvqWZ-n6RDLU8xYmwxmKAWS
X-Authority-Analysis: v=2.4 cv=FryQbGrq c=1 sm=1 tr=0 ts=6ac105fc cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=oYlp4R8hcnwt0YeveLgA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-03_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030054

On Fri, Oct 2, 2026 at 11:17=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Fri, Oct 2, 2026, at 21:04, Jens Wiklander wrote:
> > On Fri, Oct 2, 2026 at 4:59=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wr=
ote:
> >>
> >> On Fri, Oct 2, 2026, at 16:24, Jens Wiklander wrote:
> >> > Hello soc maintainers,
> >> >
> >> > Please pull these fixes for the OP-TEE driver in the TEE subsystem.
> >>
> >> I noticed that the contents of this branch are not in Linux-next.
> >> Is this intentional?
> >
> > I made a small last-minute change in the commit message for "optee:
> > register TEE devices only once fully initialized". That's why it may
> > seem new.
> >
> > "tee: optee: ffa: support shared memory offsets on large-page kernels"
> > is brand new.
> >
> > I thought it was better to send them sooner than to sit on them. Both
> > are added to my next branch, so I assume they will show on the next
> > update.
> >
> > Please let me know if you want me to keep them on linux-next for a
> > minimum number of days before sending the pull request.
>
> Thanks for the explanation, that makes sense. You need to decide how
> confident you are in the contents before you send them, I was just
> worried that this had not seen any testing at all because it was
> inadvertently left out of linux-next.
>
> If you are ever not sure, just mention that in the pull request message.

Got it, thanks.

/Jens

>
>       Arnd
