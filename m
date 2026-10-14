Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C0C35BDC2
	for <soc@lists.linux.dev>; Wed, 14 Oct 2026 06:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959667; cv=pass; b=W3mo4uR2UQTq+/87BXanepAVURSAc82vSTR97YKrhgxJMvx1EHd8g/W6hCgpemJDm5BTzMSE2m4tMo8ftKYpa7m/PM9K9VhuwIg2LRvjVYZcrhR1JBdby3Xl5r4okxrSgQSBwzaNCdWMR994lqtZzs0irrdhNDd5F30fEBkF1pA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959667; c=relaxed/simple;
	bh=90oYzEcfAGhlmbIytB6ZBVErZRVadMV+TuB9PDBwSvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=okyl8kT3fTlVScWtjiMvWmNChMdxrHM4duv+6ayoainTmBMkpolnL8Gk50wE9jEjDVBycZCjKZrUciyzNulBAwb2pVzOzTYR/WWUy8dkTnwfxpRyY6Mpe4PWPpUyyhwsv/U5pKtul1U+Bi3jbFpZp00bj156aH0B9Cq9kmSl8Rc=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tcv2LSmE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dYJh3XYn; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tcv2LSmE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dYJh3XYn"
Received: by smtp.kernel.org (Postfix)
	id D46EF1F000FF; Wed, 14 Oct 2026 06:34:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1791959665;
	b=PkKVE6Y9Xq/0ojaLqYQRb+WArmhNcqDsb8lp1tC/Sd8jVBluW5BWQ+vTZ8WTCbIDjZRB
	 kJT6gcob1gt5pvKjBaWUit5+pXbPdC27hcGfKqTIKAUZaSQooBayJiskisvJBn+faG3D6
	 oRqTVCfR0IunUnaM3EkfnZxw3vbjog9XoMG1aFiPZmGoDn54sB+5STFgYsDH0eolON6Pb
	 elsjLzWYC6dOfFw0XMfGl2JKmRdCjdftzQAJ7DM6/B70ahZQ7AimmQC0+cm2qKicURUdF
	 B7Nh/KnEEufxspz0Ul97crnqTcbq9fVio4xV3CEbSyxzd53B4MpFjEw8dPh+pCd1T3g==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791959665;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cdLX+P1EZX3dQUm08QoqVl1tumEZ+n3uHPlV6eFJgDg=;
	b=BtljoQKh/Q6CFyM+zXpNqlkTLVtFl+cvIXEa/qlAoGJmgCya5IUNagxQu8Q3atiGev13
	 SNq50MbZOL9gm5rIVA2wOl+Kg4bkphnVfjkKZvI4iHtMWlZqSBnt1+y/jgSGc+O7J5VDD
	 Nrh0zO+HXsMxGwQlgtKIDu9fsethDh4Qft6RVPjGgSsewJp8Z+LM3sU/YbkPPMqtS5gPS
	 neBUE4EJNjOIFM9t4hPvaimXwscapgnDZiogVEonF+Mmu4KrR7KAPscE9Z/gdg62i/qY5
	 zUtPw2vnI4Q+/FV/CDJUi9tSfzvx5+0nLKGWcT2Hf8cwivybvKrkvZf29eLXlG1ILfw==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tcv2LSmE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dYJh3XYn;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 141CF1F00893
	for <soc@kernel.org>; Wed, 14 Oct 2026 06:34:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tcv2LSmE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dYJh3XYn
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 141CF1F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E685kA2515934
	for <soc@kernel.org>; Wed, 14 Oct 2026 06:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cdLX+P1EZX3dQUm08QoqVl1tumEZ+n3uHPlV6eFJgDg=; b=Tcv2LSmE+Uo4D/De
	cYTg7jlnL9VqM3B4x3nE49YQaxwbtXhAFy9Z5pkCtPgCmm0iOmdEogPUEgiuPBzh
	ulVVE7BaMLkYa8eh4tPciZAovtmhzNBjo9Y9r66cTbH1FQ/CibXYXA66mX09F3Zw
	s7Lo5KniZ2UFpLbKGKjZEnvYdVSHoBMtse22R0fiQVqOB7H6AMiX+2gJjTZeEVfg
	Qi6W1riHkLeKN92xbqCxZUUrGviqUzQ+/GTqSJaksLg69SOETvnqd2mbKtHdMIOz
	0Zr5KTMsGwuQbldSLRwazEJfmuIeyrGtkWJVfxE+Ao4NgmD78xGvHRGR6sCWfHwX
	rYyn9Q==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha470837a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@kernel.org>; Wed, 14 Oct 2026 06:34:23 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-677deb12bceso5593302d50.0
        for <soc@kernel.org>; Tue, 13 Oct 2026 23:34:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791959658; cv=none;
        d=google.com; s=arc-20260327;
        b=EZJFgdxCPp/hbliLXdiqPqLPNk9lvFQwKTrBzqi/TwdpY0y7KmBaya4XafXfN+mqw8
         1HvItVLFDVlLCEVDl51aKDKooiwGS5WqUmU+Twj03LwRptHqUM8fwmm2zr7JUidbZCiH
         m8L4OcwhNPDYux7uYSVPK1DNcBKkM4HGCGNrFuF0TFkPRoK1PNZwu6zTeFS2kjQYSZNt
         JC0ngO5WQGCd0Kj4z4uKiQotLBGbRXMKBZ0eNARweIR6Db8lThdZDeqe01cViSr7ZvAO
         a1E4ddE6vCUlq5t9uOByWPTSF/a8m55HGEcUsCQ97CDfnAZFEwStQ1gR7X5Vi5EDq/Hz
         o7yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cdLX+P1EZX3dQUm08QoqVl1tumEZ+n3uHPlV6eFJgDg=;
        fh=Ylj9rfTDsw455bqIJ0kRTvr7rVYbkTg2ZPmszpaTs6c=;
        b=GvDcq5WFyaq7KiBxtltSSCBgmpKKBYOEprAPCAEoPVj5fUO41N2EAUQ2Ff2UHdVqlO
         df1ZFJ5B7iqJzvlth+8JdpExs56yP6+cGwB77rUfT3lp5o23maxftWnwAIqe00HSzssV
         wtCM3bI+FcDT0J/NZved7AKbzaKD+9U+ncT8MZOQVvjxxoOdNoGScnIgWMA/4NzzpIpj
         vwYvG8ycnbtj/cLKXffdL+zjwAnGQoboZKLFdeYIH8I/eiYTf342vbJdxqGpiFPnYqo+
         MwzqfHm472u96LFK37sZer7lWoL7e1wDlhCTWTkVTHuLaB843ULu3yhPKCknW6SFin4/
         qBEw==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791959658; x=1792564458; darn=kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cdLX+P1EZX3dQUm08QoqVl1tumEZ+n3uHPlV6eFJgDg=;
        b=dYJh3XYnMZE6QX5hv9n8dRsU7lcFzBj405QIzyRa2Gqx+oiMKWsqUJex5HjwByTen3
         kGVSKvEjsXOE4cm8aafDU644wONP1OgOLAFIcAtPbqvl2J1Xc5CFbF3ud6ES3kSv0gvP
         Q9XI+nMcMRapTbxuncoc2vXD+6x5w/VVNJquBLFNOmLXWMnCFGgpbiP0NeWkwooWv8pv
         5vZ7j8xlRLekGhygjAU/bzfgsrYdhmwRyZUf4/ILFfqM0dQrkY/0hdZQfBCdoHt+RbtC
         SllTUkTOC0lq5I+/mTVHvdeOdGME+plTOdXMa0gSG7ndaaMSTsYSnsYMPfhUylpnQxL1
         +hog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959658; x=1792564458;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cdLX+P1EZX3dQUm08QoqVl1tumEZ+n3uHPlV6eFJgDg=;
        b=kx4To2cXsvTlmGcNjemX6P6mfn2ix3SBz2l3Krsi6wmbiiu/7SouGQ4F64tZcfs2ir
         0v3X4pBhNhKJw3AYInLmhlqUAXeEDlS+mMXnaWblsrOL4Gh6i9cJ9QVfId6Rk+Kob8mA
         f3Z/Aoyj5u2RPd6mPAbCzjolC4k18y+Qi5YZIUfZ5lDV8o7dDs5TTMoKY27qQG6kYxwJ
         dQv2LcmlYB5AgRZCY1wiO+wwPaYAPKxCrYh2cOby6/RfoVQJipBciSbu5WoXzE/ld1Fp
         t0OZ6d0QZYiKtJSvxtGewc799s+tnq07MCZ/28xPksW+60OGBH0/AisexlBoGciNvrQQ
         HOkw==
X-Forwarded-Encrypted: i=1; AKwUvBxm0N6jHcPDlnkLxITEbDz/bkckBsFdVMIkX33yuwszJ79jcLqYpCsbe0ZNM0PpLRrVupI=@kernel.org
X-Gm-Message-State: AFq9FYJTNIiPRlCuj/WcADn90tZHPwqmuK7s2oTBfYBAOrd5KBz4iyJo
	7bO5IC00g/2S5KpLDzm/yV3SLaSAf9+e6EyOlzM9oYugZt6//+aWHOrpBLIDh4BgDM7L1+O+waF
	7NVnrjtBolhtQHUEp3Tu6k+va2tNCAVvyM6lX5A184HhVl6o6Mkj1lesZzdibDE6k8mb2td+d41
	MbiQsaghUKW8wjX/Pwp//qSLg=
X-Gm-Gg: AYBFou33QrbBye4exm+LVtA8vW5cmisZ+gyAglnGo315fgUmlYgD4Spu2sFA7ue7lm8
	ItOYkcz40Rwdu6rKZhpczYmmatO9pdfOnXo8/RtCrFTo5R6JPCyqWB9hbb+gXhhS6xNkAPyUdAj
	lnsjLOkSOkS0Pipr7Ff8BsiKmML4TKb3dOAMUGrcCadplJsChtQvF2BDc=
X-Received: by 2002:a05:690e:4803:b0:672:ef08:585d with SMTP id 956f58d0204a3-679362ee333mr2258548d50.103.1791959658443;
        Tue, 13 Oct 2026 23:34:18 -0700 (PDT)
X-Received: by 2002:a05:690e:4803:b0:672:ef08:585d with SMTP id
 956f58d0204a3-679362ee333mr2258539d50.103.1791959657987; Tue, 13 Oct 2026
 23:34:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261002145140.GA784348@rayden> <522a2d28-2ac9-4a56-8a61-477be3dfbbd9@app.fastmail.com>
In-Reply-To: <522a2d28-2ac9-4a56-8a61-477be3dfbbd9@app.fastmail.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 08:34:06 +0200
X-Gm-Features: AclHuK8XdmPpo9UIpob-_3ameuxmUseYqHMzPH8-H_6Hf9QmLj-76Kiarg5W4no
Message-ID: <CAGgiveUDQvqpJKo4XuboP_46t7DPSBT1jdaTafROvobk2V5mwQ@mail.gmail.com>
Subject: Re: [GIT PULL] OP-TEE update for v7.4
To: Arnd Bergmann <arnd@arndb.de>
Cc: arm <arm@kernel.org>, soc@kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyNSBTYWx0ZWRfXxWV6Ahn5f1zM
 CHIsVRtbCmdWFlpLA/xgv65BiaMAkAtIzXeQK1qzMyOVIyYTCrHvtFggaDx1wjnGzjZ/NNQGyXK
 GKTd2Ej/NuBdJXzzUVGFqy3UXl/YUBiwqqHpEkkbgvpzOziY8sWI8rNuTFONF5HN2x4GAH0gdUn
 nyhimeAxTUDGqi1BxMN/0PxYAUOMs8jgEL+2E9tElIB9jXqXOn8j8szyC74A9I7p1h/FpfOq1x2
 g4n/39x1mfnmsm1zrxI/rvwE8UD1RL18hU5OzkchsvMg9hE3rN31xTGJX6bt9c2H6tLnMcErUj7
 J+20wx3yNahadnCDviWwOtTOZY8JUPG6ve0Jpb4rQwOj7rGda9MWiOcIqLzOSLClVZQ3MaWvwjH
 M41s9JyG9mC5Oxp2JTBBRPA+uPnibGKBW64lPfRvz8PDwl7Jy9gs57/UmuAD9j40UHPrLOmyUKd
 HKB/FISd2yks7OpZFiw==
X-Proofpoint-GUID: v5bijXgYwyZ1p6tS-JGpFcoGSlotL1Nn
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acf226f cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=SNq30pm9LGA7DVCV1CQA:9 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-ORIG-GUID: v5bijXgYwyZ1p6tS-JGpFcoGSlotL1Nn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyNSBTYWx0ZWRfXyCthszlgr2qR
 XzIv3Ovp9Ty7c4vPnwQRW/iTyHL0sXqsAOXhEKQ20f5UwT69XpCszgfhYA5LPsz1ld87M2aiAnu
 POMfK0ymfJgjF9xs7YFU2EZpMwQhHb0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140025

Hi Arnd,

On Tue, Oct 13, 2026 at 4:53=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Fri, Oct 2, 2026, at 16:51, Jens Wiklander wrote:
> > for you to fetch changes up to ccd4b23398acaf2139cf04f1ba0a66150cbf2663=
:
> >
> >   tee: optee: build the Arm-specific code only on Arm (2026-10-02
> > 16:28:41 +0200)
> >
> > ----------------------------------------------------------------
> > Build the OP-TEE driver's SMC and FF-A code only where supported
> >
> > ----------------------------------------------------------------
> > Marouene Boubakri (1):
> >       tee: optee: build the Arm-specific code only on Arm
>
> I had a look at the contents and saw that it keeps the
> IS_REACHABLE() checks that are notoriously error-prone.
> E.g. this part just looks broken:
>
> @@ -257,8 +266,12 @@ struct optee {
>         const struct optee_ops *ops;
>         struct tee_context *ctx;
>         union {
> +#ifdef CONFIG_HAVE_ARM_SMCCC
>                 struct optee_smc smc;
> +#endif
> +#if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
>                 struct optee_ffa ffa;
> +#endif
>         };
>         struct optee_shm_arg_cache shm_arg_cache;
>         struct optee_call_queue call_queue;
>
> The presence of the 'ffa' member in the union is conditional
> on whether the driver that includes the header is a loadable
> module or built-in, and this changes the entire structure
> layout if both types of users are present.
>
> The intention of the patch does make a lot of sense,
> but as far as I can tell, only the Kconfig change is
> actually required, while the added preprocessor checks
> only make it harder to read and it should have been
> sufficient to change the existing IS_REACHABLE() to
> IS_ENABLED() for consistency.
>
> Sorry I did not notice this one earlier as I was travelling,
> but I think I can't pull this version, please respin.

Thanks for catching this. We'll repin.

Cheers,
Jens
